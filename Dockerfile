FROM docker:19.03.12-dind

# Host Environment
ARG ENV
ENV ENV=$ENV

# NodeJS Environment
ARG NODE_ENV
ENV NODE_ENV=$NODE_ENV

# Install aws cli
RUN \
    apk -Uuv add --no-cache gcc openssh \
        musl-dev libffi-dev openssl-dev \
        python2-dev py-pip && \
    pip install awscli docker-compose && \
    apk --purge -v del py-pip
