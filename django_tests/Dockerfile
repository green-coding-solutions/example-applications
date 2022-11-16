FROM python:3-alpine

WORKDIR /tmp

RUN apk add bash
RUN apk add build-base
RUN apk add git
RUN apk add libmemcached-dev
RUN apk add zlib-dev


RUN git clone https://github.com/django/django.git

WORKDIR /tmp/django/tests

RUN python -m pip install -e ..
RUN python -m pip install -r requirements/py3.txt

COPY runner.sh /tmp/django/tests/runner.sh

