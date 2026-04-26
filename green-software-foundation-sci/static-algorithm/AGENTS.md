# Agent Guide

Scope: run a number-crunching workload and emit SCI-oriented output.

## Scenario

- `usage_scenario.yml`: executes the compute workload for the SCI example.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile`

## Agent Notes

- This is the compute-bound SCI example in the family.
- Check the scenario before changing the container, because the SCI output parsing depends on command output shape.
- `README.md` provides the short human summary.
