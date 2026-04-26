# Agent Guide

Scope: demonstrate stdout/stderr capture modes, detached commands, and note extraction.

## Scenario

- `usage_scenario.yml`: runs uncaptured, captured, detached, and note-producing console commands in one Alpine container.

## Entry Files

- `usage_scenario.yml`

## Agent Notes

- There is no `compose.yml`; the service is declared inline in the scenario.
- This example is about log handling semantics, not application correctness.
- `detach: true`, `log-stdout`, `log-stderr`, and `read-notes-stdout` are the important fields to preserve.
