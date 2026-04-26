# Agent Guide

Scope: serve a small FastAPI app and emit a custom SCI-oriented metric per API request.

## Scenario

- `usage_scenario.yml`: sends repeated `curl` requests to `/json` and extracts `api_requests` as a custom metric.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `Dockerfile`
- `api.py`
- `requirements.txt`

## Agent Notes

- `custom_metrics.api_requests` in the scenario is part of the example contract; keep it aligned with the app output.
- If the task is about request cost or SCI calculation, inspect both `usage_scenario.yml` and `api.py`.
- This directory had no local README; use this file as the primary orientation doc.
