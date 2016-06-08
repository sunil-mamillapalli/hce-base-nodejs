#!/usr/bin/env bash

set -e

source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/log.bash" TEST

main() {
  local source_dir="${1:?Source directory is required first arg}"
  local output_dir="${2:?Output directory is required second arg}"

  log:start

  (
    set -x
    cd "$source_dir/app/"
    action:test
  ) 2>&1 | log:output

  log:end
}

action:test() {
  die "Please define the function: 'action:test'"
}

[[ $0 != "$BASH_SOURCE" ]] || main "$@"

# vim: set lisp ft=sh:
