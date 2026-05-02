function load_env --description 'Load KEY=value lines from a .env-style file into fish global env'
    set -l file $argv[1]
    test -f "$file"; or return 0

    while read -l line
        # skip blank lines and comments
        string match -qr '^\s*(#|$)' -- $line; and continue
        # split on first '='
        set -l parts (string split -m 1 = -- $line)
        test (count $parts) -eq 2; or continue
        set -l key (string trim -- $parts[1])
        set -l val (string trim -- $parts[2])
        # Strip optional surrounding single or double quotes so that the same
        # ~/.env file behaves identically when bash sources it: bash parses
        # KEY="value" as shell code and naturally drops the quotes, so fish
        # must do the same to avoid setting the var to a literal `"value"`.
        set val (string replace -r '^"(.*)"$' '$1' -- $val)
        set val (string replace -r "^'(.*)'\$" '$1' -- $val)
        # -g persists past this function's scope; -x exports to child processes.
        set -gx $key $val
    end <$file
end
