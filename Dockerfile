FROM docker:latest

# Host Environment
ARG ENV
ENV ENV=$ENV

# NodeJS Environment
ARG NODE_ENV
ENV NODE_ENV=$NODE_ENV

# Update repositories
RUN apk update

# Install python
RUN apk add --no-cache python3-dev python2-dev

# Install aws cli
RUN \
    apk -Uuv add --no-cache make gcc groff less git openssh \
        musl-dev libffi-dev openssl-dev \
        python2-dev py-pip && \
    pip install awscli docker-compose && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

# Install gettext to overwrite a
# file with environment variables
RUN apk add --no-cache iptables gettext
