#!/usr/bin/env bash
# grep and include header in output
function greph () {
    IFS= read -r header
    echo "$header"
    grep "$@"
}

function git-root() {
    cd "$(git rev-parse --show-toplevel)"
}