#!/usr/bin/env bash

source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/test.sh"

action:test() {
  $source_dir/app/.heroku/node/bin/npm install
  $source_dir/app/.heroku/node/bin/npm test
}

main "$@"
