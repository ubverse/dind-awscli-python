FROM python:3.8-slim-buster

# Host Environment
ARG ENV
ENV ENV=$ENV

# Python Environment
ARG PYTHONUNBUFFERED
ENV PYTHONUNBUFFERED $PYTHONUNBUFFERED

# Update repositories and install dependencies
RUN apt-get update -yy \
    && apt-get upgrade -yy \
    && apt-get install -yy libpq-dev gcc

# Install Pipenv (Python Package Manager)
RUN pip install --no-cache-dir pipenv

# Install AWS cli
RUN pip install --no-cache-dir awscli 

# Install Virtualenv
RUN pip install virtualenv

# Show Python and package managers versions
RUN python --version && \
    pip --version && \
    pipenv --version
