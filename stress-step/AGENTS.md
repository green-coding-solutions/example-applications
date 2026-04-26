# Agent Guide

Scope: scale CPU stress step by step across increasing core counts.

## Scenario

- `usage_scenario.yml`: increases the number of stressed cores over time.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile`

## Agent Notes

- This is the stepwise scaling variant in the stress family.
- Keep the staged progression readable; that progression is the point of the example.
