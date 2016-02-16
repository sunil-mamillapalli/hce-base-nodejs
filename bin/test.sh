#!/usr/bin/env bash

set -e

source_dir="${1:?Source directory is required first arg}"
(cd "$PWD/$source_dir" && /src/node/bin/npm test)
