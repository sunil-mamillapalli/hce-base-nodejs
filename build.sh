#!/bin/bash

set -e
npm install
docker build -t helionce/hce-base-nodejs  .
docker push helionce/hce-base-nodejs:latest
