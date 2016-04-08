#!/usr/bin/env bash

set -e

source_dir="${1:?Source directory is required first arg}"
output_dir="${2:?Output directory is required second arg}"

echo $source_dir
echo $output_dir

echo "Pruning git history"
rm -rf $PWD/$source_dir/.git

(date -u +"%Y-%m-%dT%H:%M:%SZ" > "$PWD/$output_dir/starttime")
(cd "$PWD/$source_dir" && npm install --unsafe-perm );
(cp -pr "$PWD/$source_dir/" "$PWD/$output_dir/app");
(date -u +"%Y-%m-%dT%H:%M:%SZ" > "$PWD/$output_dir/endtime")
