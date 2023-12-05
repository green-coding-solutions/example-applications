# JMeter

[Apache JMeter](https://jmeter.apache.org/) is a load and performance testing tool.
This example demonstrates how to use JMeter to execute a test plan that makes HTTP requests to a web application.

It is based on a customized [JMeter Docker image](https://hub.docker.com/r/t2project/jmeter).

As an example web application the reference application [T2-Project](https://t2-documentation.readthedocs.io) is used.

## JMeter Execution

JMeter gets executed as part of the flow in `usage_scenario.yml` with the following command:

```bash
jmeter -Jhostname=gcb-backend -Jport=8080 -JnumExecutions=1 -JnumUser=1 -JrampUp=0 -JnumProducts=1 -JthinkTimeMin=0 -JthinkTimeAdditionalRange=0 -JtimeBetweenExecutions=0 -JloggingEnabled=true -n -t /tmp/repo/jmeter-test-plan.jmx
```

`hostname`, `port`, `numExecutions`, `numUser`, `rampUp`, `numProducts`, `thinkTimeMin`, `thinkTimeAdditionalRange`, `timeBetweenExecutions` and `loggingEnabled` are environment variables that get passed to JMeter. They are specific for this test plan (`jmeter-test-plan.jmx`).
If you want to understand this test plan you can use the JMeter GUI and open the file `jmeter-test-plan.jmx`.

## Running the measurement

To check how to run the measurements check out our [Documentation](https://docs.green-coding.berlin)
