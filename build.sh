#!/bin/bash

set -e
docker build -t helionce/hce-base-nodejs  .
docker push helionce/hce-base-nodejs:latest
