# Agent Guide

Scope: demonstrate inline `setup-commands` and shell execution in a minimal service definition.

## Scenario

- `usage_scenario.yml`: defines the service inline, runs setup commands, then executes shell commands with log capture and ignored errors.

## Entry Files

- `usage_scenario.yml`

## Agent Notes

- There is no separate `compose.yml`; the service is declared directly in the scenario file.
- Use this example when the task is about scenario syntax rather than application behavior.
- The `ignore-errors` and shell settings are part of the demonstration and should not be removed casually.
