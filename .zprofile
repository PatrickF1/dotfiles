# Sourced once per login zsh shell (on macOS, that's every new terminal window).

eval "$(/opt/homebrew/bin/brew shellenv)"

# Machine-local config (gitignored) shared with bash.
# Must be sourced after ~/.env, since it references vars defined there.
[ -f "$HOME/secrets.sh" ] && . "$HOME/secrets.sh"
