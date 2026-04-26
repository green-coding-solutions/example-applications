# Agent Guide

Scope: run a larger CPU stress workload than the base `stress` example.

## Scenario

- `usage_scenario.yml`: executes the higher-load stress case.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile`

## Agent Notes

- Use this when you need a stronger CPU signal than `stress`.
- Keep comparisons with `stress` and `stress-step` explicit, since those directories cover related but different patterns.
