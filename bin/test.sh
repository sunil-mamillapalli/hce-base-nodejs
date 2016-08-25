#!/usr/bin/env bash

source "$(dirname $BASH_SOURCE)/../lib/test.sh"

action:test() {
  PATH=$PATH:$source_dir/app/.heroku/node/bin/; npm test
}

main "$@"
