#!/usr/bin/env fish
echo "Installing files for current user."
echo "Interactively symlinking the dot files into the home directory."

REPO_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for dotfile in $REPO_DIR/bash/.{aliases,bashrc,bash_profile,functions}; do
    ln -i -s $dotfile ~
done
touch ~/.hushlogin

for dotfile in $REPO_DIR/git/.{gitconfig,gitignore_global}; do
    ln -i -s $dotfile ~
done

if [ ! -f ~/.git-completion.bash ]; then
    echo "Downloading the latest git-completion Bash script."
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

echo "Installing fish configs"
FISH_CONFIGS_HOME="$HOME/.config/fish"
for fishConfig in $REPO_DIR/fish/{config.fish,fishfile}; do
    ln -i -s "$fishConfig" "$FISH_CONFIGS_HOME"
done

if [ ! -f ~/.config/fish/completions/docker.fish ]; then
    echo "Downloading the latest docker fish completions"
    command -v docker && curl https://raw.githubusercontent.com/docker/cli/master/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish
fi

echo "Iteractively symlinking Sublime Text 3 settings into their home."
SUBLIME_PREFERENCES_HOME="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
for sublimeSettingsFile in "$REPO_DIR/st3/"*; do
    ln -i -s "$sublimeSettingsFile" "$SUBLIME_PREFERENCES_HOME"
done

sh $REPO_DIR/osx.sh
echo "Done. You must restart terminal or source the dot files before the changes will take effect."

