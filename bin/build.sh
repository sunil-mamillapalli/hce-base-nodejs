#!/usr/bin/env sh

set -e

source_dir="${1:?Source directory is required first arg}"
output_dir="${2:?Output directory is required second arg}"

echo $source_dir
echo $output_dir

echo "node version is : $(node --version)"

echo "Pruning git history"
rm -rf $source_dir/.git

(date -u +"%Y-%m-%dT%H:%M:%SZ" > "$output_dir/starttime")
(cd "$source_dir" && npm install --unsafe-perm );
(cp -pr "$source_dir/" "$output_dir/app");
(date -u +"%Y-%m-%dT%H:%M:%SZ" > "$output_dir/endtime")
