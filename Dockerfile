FROM docker:19.03.12-dind

# Host Environment
ARG ENV
ENV ENV=$ENV

# NodeJS Environment
ARG NODE_ENV
ENV NODE_ENV=$NODE_ENV

# Update repositories
RUN apk update

# Install python
RUN apk add --no-cache python2-dev gettext

# Install aws cli
RUN \
    apk -Uuv add --no-cache make gcc groff less git openssh \
        musl-dev libffi-dev openssl-dev \
        py-pip && \
    pip install awscli && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*
