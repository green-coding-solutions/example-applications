# Linting

This example demonstrates the energy usage of two code linting tools in the Python ecosystem.

It uses a small an Alpine based image that contains Python3.10 to `git clone` the latest  
development version of the `green-metrics-tool` and creates a virtual environment in which  
it sets up an installation of [Pylint](https://pylint.readthedocs.io/en/v2.17.2/) and [Ruff](https://beta.ruff.rs/docs/).

Pylint is a well established and renowned linting tool that is highly configurable and extensible.
Ruff is a up-and-coming linter that is implemented in Rust and is experiencing a surge in functionality and users.

While both of these tools implement different rules for linting, there is a considerable overlap.
The intent of this example is to show the results of two tools running on the same code with the same settings.

The default configuration was generated for both tools, and then then modified to only use the union of rules  
available in both tools. See `rules.md` for details.
