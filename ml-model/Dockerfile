FROM python:3.10

WORKDIR /tmp
COPY ./requirements.txt /tmp/requirements.txt
RUN pip3 install -r requirements.txt

COPY ./30-days-of-ml_train.csv /tmp/30-days-of-ml_train.csv
COPY ./30-days-of-ml_test.csv /tmp/30-days-of-ml_test.csv
COPY ./hyperparameter_tuning.py /tmp/hyperparameter_tuning.py

# Switching to a non-root user for security concerns
CMD ["bash"]
