# Agent Guide

Scope: compare the cost of Python linting with Pylint and Ruff.

## Scenarios

- `usage_scenario.yml`: runs both Pylint and Ruff in one flow.
- `usage_scenario-pylint.yml`: runs only Pylint.
- `usage_scenario-ruff.yml`: runs only Ruff.

## Entry Files

- `usage_scenario.yml`
- `usage_scenario-pylint.yml`
- `usage_scenario-ruff.yml`
- `Dockerfile`
- `rules.md`

## Agent Notes

- Choose the single-tool scenarios for isolated comparison work and the combined scenario for sequential benchmarking.
- `ignore-errors: true` is intentional because lint findings are expected.
- The example clones and lints external code, so network and upstream-branch changes can affect results.
- `README.md` explains the rule-set alignment between tools.
