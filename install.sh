echo "Installing files for current user."
echo "Interactively copying the dot files into the home directory."

REPO_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for dotfile in $REPO_DIR/.{aliases,bash_profile,gitconfig,gitignore_global,functions}; do
    cp -i $dotfile ~
done
# install latest git-completion Bash script
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash

echo "Done. You must restart terminal or source the dot files before the changes to take effect."

echo "Iteractively copying Sublime Text 3 settings into their home."

SUBLIME_PREFERENCES_HOME="$HOME/Library/Application Support/Sublime Text 3/Packages/User/"
cp -i $REPO_DIR/Settings/Preferences.sublime-settings "$SUBLIME_PREFERENCES_HOME"
cp -i "$REPO_DIR/Settings/Default (OSX).sublime-keymap" "$SUBLIME_PREFERENCES_HOME"
echo "Done."

sh $REPO_DIR/osx.sh