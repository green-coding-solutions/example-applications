# Agent Guide

Scope: serve the pre-generated static site from `htdocs/` and measure simple HTTP access.

## Scenario

- `usage_scenario.yml`: runs a stock `httpd` container, copies `htdocs/` into place, and curls the site from a separate container.

## Entry Files

- `usage_scenario.yml`
- `compose.yml`
- `htdocs/`
- `README.md`

## Agent Notes

- This is the static-site side of the `wordpress-vs-hugo` comparison.
- `compose.yml` is only relevant for manual local serving. It mounts `wordpress.conf`, while `Dockerfile-hugo-apache`, `Dockerfile-mariadb`, `hugo-static.conf`, and `wordpress-dump.sql` are legacy comparison artifacts rather than default entry points.
- Use the sibling `wordpress-minimal` example for CMS comparisons.
