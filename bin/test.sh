#!/usr/bin/env bash

source "$(cd $(dirname $BASH_SOURCE)/..; pwd)/lib/test.sh"

action:test() {
  /src/app/.heroku/node/bin/npm install
  /src/app/.heroku/node/bin/npm test
}

main "$@"
