# Agent Guide

Scope: execute a bundled JMeter test plan against the example services.

## Scenario

- `usage_scenario.yml`: runs the JMeter workload defined by `jmeter-test-plan.jmx`.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `jmeter-test-plan.jmx`

## Agent Notes

- Treat `jmeter-test-plan.jmx` as the behavioral source of truth for the load pattern.
- If a task changes the request mix, update the `.jmx` file and keep the scenario aligned.
- `README.md` gives the existing human overview.
