## Pre-reqs
Make sure you have `pytest` and `pydantic` installed:
`pip install pytest pydantic`

The tests assume and require that the example-applications repo and the green-metrics-tool repo are living side-by-side with each other

```
drwxrwxr-x 20 dan  dan       4096 Dez  8 10:00 example-applications/
drwxrwxr-x 12 dan  dan       4096 Dez  8 12:01 green-metrics-tool/
```
Please make sure that your green metrics tool is configured to your system, and your `green-metrics-tool/config.yml` file only has the metric providers turned on which work for your local system.

## Installation
To run the tests, first make sure that your green-metrics-tool testing setup is complete. Full instructions on how to do so can be found in `green-metrics-tool/test/README.MD`, but in short, you simply have to run the `green-metrics-tool/test/setup-test-env.sh` script.

## Running
In green-metris-tool tests subfolder, make sure you have the GMT properly installed and then first run the `green-metrics-tool/test/start-test-containers.sh` script. 
This will start the docker containers necessary to run the green metrics tool tests.

Then from the `example-applications/test` directory first activate the GMT *venv* via `source ../../green-metrics-tool/venv/bin/activate`, and then run `pytest smoke_test.py -k "test_all_directories"`

To test a single directory, run something like this:

`pytest smoke_test.py::test_a_directory --name <name_of_directory_to_test>`

## Dotfiles
The smoketests will iterate over all the directories and assumes that they are working applications with usage-scenario.yml and compose.yml files that are meant to used with the green metrics tool. 

There are two dotfiles you can use to modify this behaviour.

If a directory is not meant to be an example application at all and should be skipped, please put a .skiptest file in the directory.

If the example directory lives in a subfolder of a directory instead, please put a .scantest file in that directory.