#!/usr/bin/env bash

# http://stackoverflow.com/a/6110446
set -e
trap 'prev_cmd=$this_cmd; this_cmd=$BASH_COMMAND' DEBUG
trap 'EC=$?; BAD_CMD="$prev_cmd"; [[ $EC -ne 0 ]] && echo "Exit: $EC, due to: $BAD_CMD"' EXIT

CACHE_ROOT="$HOME/.cache/dotfiles"

mkdir_p () {
  for i in "$@"; do
    [[ ! -d "$i"     ]] && mkdir -p "$i" || true
  done
}

verifylink () {
  [[ "$(readlink "$1")" == "$2" ]]
}

makelink () {
  [[ ! -e "$1" ]] && ln -svf "$2" "$1" || true
}

shallow_clone () {
  [[ ! -d "$2" ]] && git clone --depth 1 "$1" "$2" || true

  pushd "$2" > /dev/null
  git submodule init && git submodule update
  popd > /dev/null
}

mkdir_p "$CACHE_ROOT"
