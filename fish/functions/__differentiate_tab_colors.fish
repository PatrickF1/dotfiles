#!/usr/local/bin/fish
function __differentiate_tab_colors -d "set the current iTerm2 tab to the next color in a sequence of colors"
    # these colors values are from the material-design iTerm theme
    # https://github.com/MartinSeeler/iterm2-material-design
    set black 546E7A
    set red FF3D49
    set green 69F0AE
    set yellow FFD740
    set blue 40C4FF
    set magenta FF4081
    set cyan 64FCDA
    set white FFFFFF
    set colors_array $black $red $green $yellow $blue $magenta $cyan $white

    if set -q __tab_color_index
        # increment __tab_color_index so that the next tab will have a different color
        set __tab_color_index (math "$__tab_color_index + 1")
        # modulo so it doesn't keep growing
        set __tab_color_index (math "$__tab_color_index % 8")
    else
        set -U __tab_color_index 0
    end
    # need to add 1 to __tab_color_index fish arrays indices start at 1
    set color_index (math "$__tab_color_index + 1")
    it2setcolor tab $colors_array[$color_index]
end