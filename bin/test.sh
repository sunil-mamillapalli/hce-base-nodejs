#!/usr/bin/env bash

set -e

source_dir="${1:?Source directory is required first arg}"
output_dir="${2:?Output directory is required second arg}"

(date -u +"%Y-%m-%dT%H:%M:%SZ" > "$PWD/$output_dir/starttime");
(cd "$PWD/$source_dir/app" && npm test);
cp -pr "$PWD/$source_dir/." "$PWD/$output_dir"
(date -u +"%Y-%m-%dT%H:%M:%SZ" > "$PWD/$output_dir/endtime")
