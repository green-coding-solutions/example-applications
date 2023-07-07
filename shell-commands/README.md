This is an example on how to use *shell* syntax in console commands for the Green Metrics Tool (GMT).

By default no shell is used to execute commands, but just the process is forked.

If you use the `shell` key either in the `setup-commands` or the `commands`-list you can 
instruct the GMT to run the command in a shell.

The shell must be available in your container and understand the `sh -c` startup command.

Typical shells that support this are:
- `sh`
- `ash`
- `bash`
- `zsh`

