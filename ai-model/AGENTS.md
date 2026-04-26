# Agent Guide

Scope: run a small Ollama model and measure inference cost.

## Scenarios

- `usage_scenario_cpu.yml`: CPU-only path for `gemma3:1b`.
- `usage_scenario_gpu.yml`: GPU path for `gemma3:1b`.

## Entry Files

- `usage_scenario_cpu.yml`
- `usage_scenario_gpu.yml`
- `compose.yml`

## Agent Notes

- Prefer the CPU scenario unless the task explicitly requires GPU.
- The GPU scenario needs NVIDIA container runtime support and `--allow-unsafe`.
- The flow pulls the model, loads it, and then runs inference, so first-run latency is expected.
- Only read `README.md` for the short human summary if you get stuck.
