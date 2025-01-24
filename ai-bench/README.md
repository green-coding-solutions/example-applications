# Introduction

This is an example on how to benchmark multiple models with https://ollama.com/

It works by crafting a  `usage_scenario.yml` file through the `./build_usage.py` script that you can then use in the
(GMT)[https://github.com/green-coding-solutions/green-metrics-tool]

## Setup

You will need to setup the ollama container and give it access to your graphics card if you want representative results
Please follow the instructions here: https://hub.docker.com/r/ollama/ollama

You then need to place all you prompts in the prompts.txt file. Each line will be one prompt. We currently don't support
checks for correctness

Then please execute the `./build_usage.py` with the models as parameters you want to benchmark. The models can be found here
https://ollama.com/library

```
./build_usage.py 'llama3.2:1b' 'tinyllama:1.1b'
```

This will create the `usage_scenario.yml` file you can then use in the Green Metrics Tool to benchmark your models.

Please note that you will need to activate the Nvidia SMI metric provider
https://docs.green-coding.io/docs/measuring/metric-providers/gpu-energy-nvidia-smi-component/ for good results.


