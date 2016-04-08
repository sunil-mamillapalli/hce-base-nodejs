#!/bin/bash

set -e
docker build -t helioncf/hce-base-nodejs:untested  .
docker push helioncf/hce-base-nodejs:untested
