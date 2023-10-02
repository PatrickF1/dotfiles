#!/usr/bin/env fish
function v --wraps nvim --description "Alias v to nvim"
    command nvim $argv
end
