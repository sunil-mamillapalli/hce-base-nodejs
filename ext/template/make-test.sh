#!/usr/bin/env bash

# Script to build and test a Java app. Callable as a single Docker entrypoint.

set -e

main() {
  local bin="$(cd $(dirname $BASH_SOURCE)/..; pwd)/bin"
  mkdir -p "$2"/{build,test}

  (
    set -x
    "$bin/build.sh" "$1" "$2/build"
    "$bin/test.sh" "$2/build" "$2/test"
  )
}

[[ $0 != "$BASH_SOURCE" ]] || main "$@"

# vim: set lisp ft=sh:
