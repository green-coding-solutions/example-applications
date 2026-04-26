# Agent Guide

Scope: train a small machine learning model and measure the workload.

## Scenario

- `usage_scenario.yml`: runs the ML training flow in the `gcb-ml-model` container.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile`
- `requirements.txt`
- `hyperparameter_tuning.py`
- `30-days-of-ml_train.csv`
- `30-days-of-ml_test.csv`

## Agent Notes

- Runtime depends on host speed; the repo README recommends increasing `flow-process-runtime` to at least `120` seconds.
- If the task changes model behavior, inspect `hyperparameter_tuning.py` and keep dataset assumptions intact.
- Use the scenario file for execution order and the Python file for algorithm changes.
