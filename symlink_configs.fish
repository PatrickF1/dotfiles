#!/usr/bin/env fish

function install_bash_files
    echo "Installing bash files"
    for file in $repo_root/bash/.{aliases,bashrc,bash_profile,functions}
        ln -i -s "$file" ~
    end

    touch ~/.hushlogin
end

function install_fish_files
    echo "Installing fish configs"
    set -l fish_configs_home "$HOME/.config/fish"
    for file in $repo_root/fish/{config.fish,fishfile}
        ln -i -s "$file" "$fish_configs_home"
    end

    # symlink fish config not checked into repo from Dropbox if it can be found
    set -l fish_secrets_path "$HOME/Dropbox/Settings/.fish_secrets"
    if test -e $fish_secrets_path
        echo "Symlinking .fish_secrets into home directory"
        ln -i -s $fish_secrets_path ~
    else
        echo "Could not find .fish_secrets; your fish configuration may be missing some environment variables"
    end

    # make the path to this repo's fish functions universally available so that config.fish can
    # prepend it to fish_function_path
    set -U dotfile_fish_functions_path "$repo_root/fish/functions"
end

function install_st3_files
    echo "Installing Sublime Text 3 files"
    ln -i -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin
    set -l sublime_preferences_home "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
    for file in "$repo_root/st3/"*
        ln -i -s "$file" "$sublime_preferences_home"
    end
end

function install_git_files
    echo "Installing git configs"
    for file in $repo_root/git/.{gitconfig,gitignore_global}
        ln -i -s $file ~
    end

    echo "Installing git shalector"
    ln -i -s $repo_root/git/git-shalector /usr/local/bin
end

function install_vim_files
    echo "Installing vim settings"

    set -l vimrc "$repo_root/vim/.vimrc"
    ln -i -s $vimrc ~/.vimrc
    ln -i -s $vimrc ~/.config/nvim/init.vim
end

set repo_root (dirname (realpath (status --current-filename)))

install_bash_files
install_fish_files
install_st3_files
install_git_files
install_vim_files

echo "Done. Please start a new shell session for the changes to take effect."
