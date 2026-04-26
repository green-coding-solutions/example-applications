# Agent Guide

Scope: measure both external downloads and internal Docker-network transfers.

## Scenario

- `usage_scenario.yml`: downloads public files with `curl`, pauses, then fetches a local test file over the internal network.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile`
- `test_1MB.jpg`

## Agent Notes

- This scenario depends on live internet access for the external transfer steps.
- It also includes a short sleep to reduce attribution races at the end of a file transfer.
- Distinguish environmental failures from local scenario problems before changing the example.
- `README.md` explains the reporter-focused intent.
