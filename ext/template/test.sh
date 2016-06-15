#!/usr/bin/env bash

set -e
set -o pipefail

source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/log.bash" TEST

main() {
  local source_dir="${1:?Source directory is required first arg}"
  local output_dir="${2:?Output directory is required second arg}"

  log:start

  local rc=0
  (
    set -x
    cd "$source_dir/app/"
    action:test || exit
  ) 2>&1 | log:output || rc=$?

  log:end

  return $rc
}

action:test() {
  die "Please define the function: 'action:test'"
}

[[ $0 != "$BASH_SOURCE" ]] || main "$@"

# vim: set lisp ft=sh:
