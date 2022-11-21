FROM python:3-slim

WORKDIR /tmp

RUN apt update && apt install -y bash git libmemcached-dev zlib1g-dev gcc


RUN git clone https://github.com/django/django.git

WORKDIR /tmp/django/tests

RUN python -m pip install -e ..
RUN python -m pip install -r requirements/py3.txt

COPY runner.sh /tmp/django/tests/runner.sh
