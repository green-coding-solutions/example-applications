# Agent Guide

Scope: generate short stress bursts separated by intervals.

## Scenario

- `usage_scenario.yml`: alternates between stress and idle phases to test burst reporting quality.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile`

## Agent Notes

- This example is tuned for timing-sensitive reporter behavior rather than steady-state load.
- Preserve the spacing between bursts unless the task is explicitly about changing the cadence.
