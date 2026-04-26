# Agent Guide

Scope: stress the runner with a deliberately long-lived measurement.

## Scenario

- `usage_scenario.yml`: executes three one-hour sleep phases in sequence.

## Entry Files

- `usage_scenario.yml`
- `Dockerfile`

## Agent Notes

- Total runtime is roughly three hours. Do not use this as a default smoke test.
- This example exists to test stability and large data collection behavior, not workload diversity.
- `.skiptest` is expected here because the scenario is intentionally too long for normal automation.
- This directory had no local README; use this file as the primary guide.
