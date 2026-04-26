# Agent Guide

Scope: generate very short stress spikes to test sampling and attribution timing.

## Scenario

- `usage_scenario.yml`: runs short pulse-like CPU activity.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile`

## Agent Notes

- Very short workloads can expose under-sampling or attribution edge cases.
- Prefer this example over `stress` only when you need pulse behavior specifically.
