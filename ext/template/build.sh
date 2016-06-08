#! bash

set -e

: "${HCE_BUILDPACK_LOCATION:=/src/buildpack}"
: "${HCE_BUILDPACK_TEMP_DIR:=/tmp/heroku-build-temp-$$}"
export STACK=cedar-14

source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/base.bash" BUILD
source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/log.bash" BUILD

main() {
  local source_dir="${1:?Source directory is required first arg}"
  local output_dir="${2:?Output directory is required second arg}"

  [[ $source_dir =~ ^/ ]] ||
    die "Source dir '$source_dir' must be absolute path."
  [[ $output_dir =~ ^/ ]] ||
    die "Output dir '$output_dir' must be absolute path."

  log:start

  log 'Compile buildpack'

  (
    set -x
    action:build
    cp -pr "$source_dir" "$output_dir/app"
  ) 2>&1 | log:output

  log:end
}

action:build() {
  die "Please define the function: 'action:build'"
}
