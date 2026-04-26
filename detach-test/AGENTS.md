# Agent Guide

Scope: demonstrate detached background processes during a Green Metrics Tool flow.

## Scenario

- `usage_scenario.yml`: starts work that continues in the background while later steps run.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile`

## Agent Notes

- This example is about process lifecycle and log capture, not application correctness.
- Expect commands that do not finish on their own and are terminated by the runner.
- Validate detach behavior from the scenario file before changing the image or command sequence.
- Use `README.md` for the original intent and local build hints.
