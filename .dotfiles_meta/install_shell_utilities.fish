#!/usr/bin/env fish

set -l path_to_shell (which fish)
if not grep -q "$path_to_shell" /etc/shells
    echo "Setting default shell to $path_to_shell"
    echo "$path_to_shell" | sudo tee -a /etc/shells >/dev/null
    chsh -s "$path_to_shell"
end

set -l vim_plug_path ~/.local/share/nvim/site/autoload/plug.vim
if test ! -e "$vim_plug_path"
    echo "Installing vim-plug for neovim"
    curl --create-dirs --location --output "$vim_plug_path" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

set -l bash_git_completion_path ~/.config/bash/git-completion.bash
if test ! -e "$bash_git_completion_path"
    echo "Installing the latest git-completion script for bash"
    curl --create-dirs --location --output "$bash_git_completion_path" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
end

if not functions --query fisher
    echo "Installing fisher and fisher plugins"
    curl -sL git.io/fisher | source && fisher install jorgebucaran/fisher
    fish -c "fisher update"
end

if test (count $tide_right_prompt_items) -gt 10
    echo "Configuring Tide prompt"
    tide configure --auto --style=Rainbow --prompt_colors='True color' --show_time='12-hour format' --rainbow_prompt_separators=Angled --powerline_prompt_heads=Sharp --powerline_prompt_tails=Flat --powerline_prompt_style='Two lines, character' --prompt_connection=Dotted --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Lightest --prompt_spacing=Sparse --icons='Many icons' --transient=Yes
    set tide_right_prompt_items status cmd_duration time
    tide reload # reload makes the changes take effect
end

if ! test -e ~/.config/nnn/plugins
    echo "Installing plugins for nnn"
    curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
end

if test -e ~/Library/Fonts/JetBrainsMono-SemiBold.ttf
    # Remove semibold variant so no editor will automatically pick it for bold
    # because it is almost indistinguishable from the regular variant
    echo "Removing JetBrains Mono SemiBold fonts"
    rm -f ~/Library/Fonts/JetBrainsMono{,NL}-{SemiBold, SemiBoldItalic}.ttf
end

# make it obvious where to put secrets
touch ~/secrets.fish
