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
RUN \
    apk -Uuv add \
        libgcc libc-dev g++ \
        make gcc groff less git openssh \
        musl-dev libffi-dev openssl-dev \
        python3-dev py-pip && \
    pip install awscli docker-compose && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

# Show Python version
RUN \
    rm /var/cache/apk/* && \
    python --version && \
    pip --version
