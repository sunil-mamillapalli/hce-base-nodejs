#!/bin/bash

set -e
docker build -t helioncf/hce-concourse-workers:hce-base-nodejs  .
docker push helioncf/hce-concourse-workers:hce-base-nodejs
