# work around for Ammonite not executing in the fish shell
# https://github.com/lihaoyi/Ammonite/issues/813
function amm --description 'Scala REPL'
    sh -c 'amm "$@"' amm $argv
end