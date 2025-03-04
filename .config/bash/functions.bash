#!/usr/bin/env bash
function git-root() {
    cd "$(git rev-parse --show-toplevel)"
}
