#!/usr/bin/env bash

set -e

source_dir="${1:?Source directory is required first arg}"
output_dir="${2:?Output directory is required second arg}"

(cd "$PWD/$source_dir" && /src/node/bin/npm install)
cp -pr "$PWD/$source_dir/." "$PWD/$output_dir"
