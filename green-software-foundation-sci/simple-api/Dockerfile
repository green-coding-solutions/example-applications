FROM python:3.11-slim

WORKDIR /tmp
COPY requirements.txt requirements.txt

RUN python -m pip install -r requirements.txt

RUN mkdir /tmp/my_app
COPY api.py /tmp/my_app/api.py

RUN rm -rf /var/lib/apt/lists/*
RUN apt update -y && \
    apt install curl -y
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/gunicorn", "--workers=2", "--access-logfile=-", "--error-logfile=-", "--threads=4", "--worker-class=gthread",  "--bind", "0.0.0.0", "-m", "007", "--user", "www-data", "--chdir", "/tmp/my_app", "-k", "uvicorn.workers.UvicornWorker", "api:app"]