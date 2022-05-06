# C compiler/development headers, python, pip and other build dependencies
# rust and cargo is required by docker-compose
FROM docker:20.10.15-dind-alpine3.15 AS system-requirements
RUN apk -Uuv add --no-cache \
    "gcc=10.3.1_git20211027-r0" \
    "make=4.3-r0" \
    "groff=1.22.4-r1" \
    "openssh=8.8_p1-r1" \
    "libc-dev=0.7.2-r3" \
    "musl-dev=1.2.2-r7" \
    "libffi-dev=3.4.2-r1" \
    "openssl-dev=1.1.1n-r0" \
    "python3-dev=3.9.7-r4" \
    "py3-pip=20.3.4-r1" \
    "rust=1.56.1-r0" \
    "cargo=1.56.1-r0"


# aws cli tools and docker-compose (rust and cargo is required to build docker-compose)
FROM system-requirements AS pip-requirements
WORKDIR /
COPY pip/requirements.txt .
RUN pip install --no-cache-dir --no-deps -r requirements.txt \
    && rm requirements.txt


# check whether the relevant binaries are accessible on $PATH
FROM pip-requirements AS binary-test
RUN python3 --version \
    && pip3 --version \
    && aws --version \
    && sam --version \
    && docker --version \
    && docker-compose --version


# host environment
FROM pip-requirements AS host-environment
ARG ENV
ENV ENV=$ENV
