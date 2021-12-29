#!/usr/bin/env fish
function vim --wraps nvim -d "Alias vim to nvim"
    command nvim $argv
end
