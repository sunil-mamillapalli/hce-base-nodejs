#!/usr/bin/env bash

# Logging support library.

LOG_NAME="${1:-LOG}"

log() {
  local date="$(log:date-time)"
  echo "[$LOG_NAME] $date -- $@" | log:output
}

log:date-time() {
  date -u +"%Y-%m-%dT%H:%M:%SZ"
}

log:output() {
    tee -a "$output_dir/log"
}

log:start() {
  log:date-time > "$output_dir/starttime"
}

log:end() {
  log:date-time > "$output_dir/endtime"
}
