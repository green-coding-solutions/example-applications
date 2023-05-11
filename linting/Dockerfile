FROM python:3.10.11-alpine3.17

RUN apk add git bash

RUN git clone --depth 1 -b dev --recurse-submodules --shallow-submodules https://github.com/green-coding-berlin/green-metrics-tool.git /tmp/linting/
COPY src/ /tmp/src/

RUN python3 -m venv /tmp/linting/venv/
RUN /tmp/linting/venv/bin/pip install ruff==0.0.261 pylint==2.17.2

CMD ["/bin/bash"]