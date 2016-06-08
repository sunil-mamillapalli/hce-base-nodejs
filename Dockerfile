FROM ubuntu:14.04

RUN \
    apt-get update \
&& \
    apt-get install -y \
        curl \
        git \
        python \
        ruby \
        vim \
&& \
    mkdir -p \
        /app/.heroku

COPY bin /src/bin
COPY buildpack /src/buildpack
COPY lib /src/lib
ENV CF_STACK=cflinuxfs2
