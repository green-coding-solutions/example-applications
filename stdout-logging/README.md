This is an example on how to log the **stdout** and **stderr** from containers with the Green Metrics Tool (GMT).

By default **stdout** and **stderr** are discarded.

By setting the keys `log-stderr` or `log-stdout` to `true` you can log these respectively.

## Best practices

Generally logging of either `stdout` or `stderr` should be turned off, because it generally creates overhead.

You should only have it turned on when you are developing or debugging.

Since the logs will be captured into a memory buffer there is a limit to how much this buffer can hold.
If you really log excessive amounts (100 MB+) then at some point the buffer might get exhausted and either you will
loose data or the run with the GMT will fail.