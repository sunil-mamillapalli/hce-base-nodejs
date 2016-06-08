#!/usr/bin/env bash

die() {
  echo "$@" >&2
  exit 1
}

error() {
  die "Error: $@"
}
