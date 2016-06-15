#!/usr/bin/env bash

set -x

source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/build.sh"

action:build() {
  locale-gen en_US.UTF-8
  local rc=0
  "$HCE_BUILDPACK_LOCATION/bin/compile" \
    "$source_dir" \
    "$HCE_BUILDPACK_TEMP_DIR" || rc=1
  rm -fr "$HCE_BUILDPACK_TEMP_DIR"
  return $rc
}

main "$@"
