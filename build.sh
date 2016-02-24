#!/bin/bash

set -e
docker build -t helioncf/hce-concourse-wokers:hce-base-nodejs  .
docker push helioncf/hce-concourse-wokers:hce-base-nodejs
