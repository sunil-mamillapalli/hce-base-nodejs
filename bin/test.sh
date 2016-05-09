#!/usr/bin/env bash

set -e

source_dir="${1:?Source directory is required first arg}"
output_dir="${2:?Output directory is required second arg}"

(date -u +"%Y-%m-%dT%H:%M:%SZ" > "$output_dir/starttime");
(cd "$source_dir/app" && npm test);
cp -pr "$source_dir/." "$output_dir"
(date -u +"%Y-%m-%dT%H:%M:%SZ" > "$output_dir/endtime")
