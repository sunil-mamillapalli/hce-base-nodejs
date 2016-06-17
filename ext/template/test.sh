#!/usr/bin/env bash

set -eu -o pipefail

source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/base.bash"
source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/log.bash" TEST

main() {
  local source_dir="${1:?Build output directory is required first arg}"
  local output_dir="${2:?Test output directory is required second arg}"

  [[ $source_dir =~ ^/ ]] ||
    die "App source dir '$source_dir' must be absolute path."
  [[ $output_dir =~ ^/ ]] ||
    die "Test output dir '$output_dir' must be absolute path."

  log:start

  log 'Test the built app'

  local rc=0; set +e
  (
    set -ex
    cd "$source_dir/app/"
    action:test
  ) 2>&1 | log:output
  rc=$?; set -e

  log:end

  return $rc
}

action:test() {
  die "Please define the function: 'action:test'"
}
