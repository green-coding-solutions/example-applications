# Familiar imports
import numpy as np
import pandas as pd
import time

# For ordinal encoding categorical variables, splitting data
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.impute import SimpleImputer
from sklearn.model_selection import train_test_split

# For training random forest model
from sklearn.ensemble import RandomForestRegressor
from xgboost import XGBRegressor
from sklearn.metrics import mean_squared_error
import optuna

train = pd.read_csv("./30-days-of-ml_train.csv", index_col=0, na_values=["", " "])
test = pd.read_csv("./30-days-of-ml_test.csv", index_col=0, na_values=["", " "])

# Separate target from features
X = train.copy()
y = X.pop('target')

object_cols = [col for col in X.columns if 'cat' in col]
num_cols = [col for col in X.columns if 'cat' not in col]

# Apply one-hot encoder to each column with categorical data
OH_encoder = OneHotEncoder(handle_unknown='ignore', sparse=False)
OH_cols = pd.DataFrame(OH_encoder.fit_transform(X[object_cols]))
OH_test_cols = pd.DataFrame(OH_encoder.transform(test[object_cols]))

# One-hot encoding removed index; put it back
OH_cols.index = X.index
OH_test_cols.index = test.index

# Remove categorical columns (will replace with one-hot encoding)
num_X = X.drop(object_cols, axis=1)
num_X_test = test.drop(object_cols, axis=1)

# Add one-hot encoded columns to numerical features
OH_X = pd.concat([X[num_cols], OH_cols], axis=1)
OH_test = pd.concat([test[num_cols], OH_test_cols], axis=1)

OH_X_train, OH_X_valid, OH_y_train, OH_y_valid = train_test_split(OH_X, y, train_size=0.1, test_size=0.1, random_state=0)

# print(OH_X.head())

def objective(trial):

    params = {
        "n_estimators": trial.suggest_int("n_estimators", 100, 1200, step=100),
        "max_depth":trial.suggest_int("max_depth", 1, 5),
        "learning_rate": trial.suggest_float("learning_rate", 1e-4, 1e-1, log=True),
        "gamma": trial.suggest_float("gamma", 0.1, 1.0, step=0.1),
        "min_child_weight": trial.suggest_int("min_child_weight", 1, 7),
        "subsample": trial.suggest_float("subsample", 0.2, 1.0),
        "colsample_bytree": trial.suggest_float("colsample_bytree", 0.1, 1.0),
        "reg_alpha": trial.suggest_float("reg_alpha", 1e-6, 100.),
        "reg_lambda": trial.suggest_float("reg_lambda", 1e-6, 100.),
    }


    inner_model = XGBRegressor(
        **params,
        n_jobs=-1,
        early_stopping_rounds=10
    )



    inner_model.fit(OH_X_train, OH_y_train,
              eval_set=[(OH_X_valid, OH_y_valid)],
              verbose=0
   )

    y_hat = inner_model.predict(OH_X_valid)

    # Note: This is only meaningful for Regressors. Use a different metric for Classifiers!
    return mean_squared_error(OH_y_valid, y_hat, squared=False)



import logging, sys
logger = logging.getLogger()
logger.setLevel(logging.INFO)

h = logging.StreamHandler(sys.stdout)

# Add 3 zeroes to the timestamp to "fake" it to nanoseconds
# Truncate string message to 19 chars max
h.setFormatter(logging.Formatter("%(asctime)s%(msecs)03d000 %(message).19s", datefmt='%s'))
logger.addHandler(h)

optuna.logging.enable_propagation()
optuna.logging.disable_default_handler()

study = optuna.create_study()
study.optimize(objective, n_trials=5)

logger.info(study.best_params)
