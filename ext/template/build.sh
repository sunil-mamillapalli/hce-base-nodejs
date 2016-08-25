#! bash

set -eu -o pipefail

source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/base.bash"
source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/log.bash" BUILD

main() {
  local source_dir="${1:?App source directory is required first arg}"
  local output_dir="${2:?Build output directory is required second arg}"

  [[ $source_dir =~ ^/ ]] ||
    die "App source dir '$source_dir' must be absolute path."
  [[ $output_dir =~ ^/ ]] ||
    die "Build output dir '$output_dir' must be absolute path."

  log:start
  log 'Remove .git history folder'
  local rc=0; set +e
  (
    set -ex
    rm -rf "$source_dir/.git"
  ) 2>&1 | log:output
  rc=$?; set -e

  log 'Compile buildpack'

  local rc=0; set +e
  (
    set -ex
    action:build
    cp -pr "$source_dir" "$output_dir/app"
  ) 2>&1 | log:output
  rc=$?; set -e

  log:end

  return $rc
}

action:build() {
  die "Please define the function: 'action:build'"
}

: "${HCE_BUILDPACK_LOCATION:=/src/buildpack}"
: "${HCE_BUILDPACK_TEMP_DIR:=/tmp/heroku-build-$$}"
export STACK=cedar-14
