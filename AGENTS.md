# Agent Guide

This repository contains independent example applications for the Green Metrics Tool.
Most agent work should start from a scenario directory that contains one or more `usage_scenario*.yml` files.

## How To Navigate

- Start with [`scenario-index.yml`](./scenario-index.yml) to find the right example quickly.
- Then read the nearest `AGENTS.md` in the target directory.
- Use `usage_scenario*.yml` as the source of truth for services, commands, and flow order.
- Use `compose.yml` and `Dockerfile*` files for runtime and build details.
- Treat `README.md` as human-oriented background unless the local `AGENTS.md` tells you otherwise.

## Repository Conventions

- Each scenario directory is intended to be runnable on its own.
- Two nested families contain child examples instead of a single root scenario:
  - `green-software-foundation-sci/*`
  - `wordpress-vs-hugo/*`
- `.skiptest` means the example is excluded from automated repo testing. Do not assume the scenario is broken.
- If a scenario and a README disagree, prefer the scenario file.

## Important Caveats

- GUI/X11 examples such as `firefox-X11` and `blauer-engel-okular-xdotool` depend on host display state and usually require unsafe volume mounts.
- `ai-model/usage_scenario_gpu.yml` requires an NVIDIA-capable Docker setup and unsafe mounts.
- Seeded CMS examples such as `drupal`, `wordpress-official-data`, and `wordpress-vs-hugo/wordpress-minimal` need database startup time before browser or curl steps run.
- `long-test` intentionally runs for roughly three hours.
- `network-test` depends on external network downloads, so failures may be environmental rather than code regressions.

## Scope Boundaries

- Ignore vendored payload content under paths such as `html/`, `wp-content/`, and similar application data trees unless the task is explicitly about the bundled sample app itself.
- Nested third-party `README.md` files inside application payloads are not repository navigation docs.

## Recommended Agent Workflow

1. Pick a scenario from `scenario-index.yml`.
2. Read the local `AGENTS.md`.
3. Inspect the referenced `usage_scenario*.yml`.
4. Open `compose.yml`, `Dockerfile*`, and helper scripts named in the scenario.
5. Only descend into bundled app content if the scenario or task requires it.

## Running an example scenario

If you want to check an example application if it is working run this:
```bash
cd /home/node/green-metrics-tool
python3 runner.py --uri /home/node/example-applications --filename stress/usage_scenario.yml` --dev-no-sleeps --dev-no-system-checks
```

You must replace `stress/usage_scenario.yml` with the path to the scenario you want to run.
