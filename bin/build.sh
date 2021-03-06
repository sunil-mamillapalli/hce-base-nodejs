#!/usr/bin/env bash

source "$(dirname $BASH_SOURCE)/../lib/build.sh"

action:build() {
  locale-gen en_US.UTF-8
  NPM_CONFIG_PRODUCTION=false NODE_ENV=development "$HCE_BUILDPACK_LOCATION/bin/compile" \
    "$source_dir" \
    "$HCE_BUILDPACK_TEMP_DIR"
}

main "$@"
