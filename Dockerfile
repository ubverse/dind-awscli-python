FROM docker:latest

# Host Environment
ARG ENV
ENV ENV=$ENV

# Python Environment
ARG PYTHONUNBUFFERED
ENV PYTHONUNBUFFERED $PYTHONUNBUFFERED

# Update repositories
RUN apk update

# Install aws cli
RUN apk -Uuv add \
    libgcc libc-dev g++ \
    make gcc groff less git openssh musl-dev \
    libffi-dev openssl-dev py-pip python-dev

# Install AWS CLI
RUN pip install awscli docker-compose && \
    rm /var/cache/apk/*

# Install Python
RUN apk add --no-cache python3 python3-dev py3-setuptools

# Install Virtualenv
RUN pip3 install virtualenv

# Show Python version
RUN python --version && \
    pip3 --version
