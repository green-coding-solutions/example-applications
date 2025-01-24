#!/usr/bin/env python3

import sys

import re

def clean_string(input_string):
    allowed_pattern = r'[^.\s0-9a-zA-Z_()\-=]'
    cleaned_string = re.sub(allowed_pattern, '', input_string)
    return cleaned_string


def main():
    models = sys.argv[1:]
    if not models:
        print("Usage: ./build_usage.py <model1> [<model2> ...]")
        sys.exit(1)

    try:
        with open("prompts.txt", "r") as f:
            prompts = [line.strip() for line in f if line.strip()]
    except FileNotFoundError:
        print("Error: prompts.txt not found in the current directory.")
        sys.exit(1)


    pull_lines = [f"'ollama pull {model}'" for model in models]

    header_lines = [
        "---",
        "name: AI Bechmark",
        "author: Your Name <please@adapt.io>",
        "description: This is a benchmark for multiple AI models",
        "",
        "services:",
        "  ollama:",
        "    image: ollama/ollama:latest",
       f"    setup-commands: [{','.join(pull_lines)}]",
        "    volumes:",
        "      - /tmp/ollama:/root/.ollama",
        "",
        "flow:"
    ]

    flow_lines = []
    for model in models:
        # Warmup step
        flow_lines.append(f"  - name: Model {clean_string(model)} warmup")
        flow_lines.append("    container: ollama")
        flow_lines.append("    commands:")
        flow_lines.append("      - type: console")
        flow_lines.append(f'        command: ollama run {model} "Tell me a joke to warm up please."')
        flow_lines.append(f"  - name: Model {clean_string(model)} prompts")
        flow_lines.append("    container: ollama")
        flow_lines.append("    commands:")

        # Prompt steps
        for i, prompt in enumerate(prompts, start=1):
            flow_lines.append("      - type: console")
            flow_lines.append(f'        command: ollama run {model} "{prompt}"')
            flow_lines.append(f'        note: "{prompt}"')

    # Write to usage_scenario.yml
    with open("usage_scenario.yml", "w") as out:
        for line in header_lines:
            out.write(line + "\n")
        for line in flow_lines:
            out.write(line + "\n")

    print("usage_scenario.yml has been created successfully.")

if __name__ == "__main__":
    main()
