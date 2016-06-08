#!/usr/bin/env bash

PIPELINE=hce-app-pipeline

fly login -t Dev_concourse -c http://192.168.99.101:8080/
fly sync -t Dev_concourse
yes y | fly \
  -t Dev_concourse \
  set-pipeline \
  -p $PIPELINE \
  -c $PIPELINE.yml \
  --load-vars-from $PIPELINE.secrets.yml
fly -t Dev_concourse unpause-pipeline -p $PIPELINE
fly -t Dev_concourse trigger-job $PIPELINE/start-job-in-pipeline
