# Introduction

This is an example on how to run an AI model with [Ollama](https://ollama.com/)

## Running the AI model on the CPU

Just run the `runner.py` and use the `usage_scenario_cpu.yml`

## Running the AI model on the GPU

You must have the NVIDIA docker container provider installed and also a GPU on your system installed.

See https://hub.docker.com/r/ollama/ollama for details.

Then run the `runner.py` and use the `usage_scenario_gpu.yml` with the `--allow-unsafe` flag to mount the GPU into the containers.