#!/usr/bin/env fish

function reset_spotify_vol -d "Reset Spotify's volume to 50%."
    osascript -e '
    tell application "Spotify"
        set sound volume to 50
    end tell'
end