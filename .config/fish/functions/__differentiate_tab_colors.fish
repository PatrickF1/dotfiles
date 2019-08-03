#!/usr/local/bin/fish
function __differentiate_tab_colors -d "set the current iTerm2 tab to the next color in a sequence of colors"
    set red ff0d00
    set green 1f8705
    set yellow ffee03
    set blue 034fff
    set white FFFFFF
    set colors_array $red $green $yellow $blue $white

    if set -q __tab_color_index
        # increment __tab_color_index so that the next tab will have a different color
        set __tab_color_index (math "$__tab_color_index + 1")
        # modulo so it doesn't keep growing
        set __tab_color_index (math "$__tab_color_index % 5")
    else
        set -U __tab_color_index 0
    end
    # need to add 1 to __tab_color_index fish arrays indices start at 1
    set color_index (math "$__tab_color_index + 1")
    it2setcolor tab $colors_array[$color_index]
end