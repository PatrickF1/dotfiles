echo "Installing files for current user."
echo "Interactively copying the dot files into the home directory."

REPO_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for dotfile in $REPO_DIR/.{aliases,bash_profile,gitconfig,gitignore_global,functions}; do
    cp -i $dotfile ~
done
echo "Done. You must restart terminal or source the dot files before the changes to take effect."

echo "Iteractively copying Sublime Text 3 User preferences into its home."

SUBLIME_PREFERENCES_HOME="$HOME/Library/Application Support/Sublime Text 3/Packages/User/"
cp -i $REPO_DIR/Settings/Preferences.sublime-settings "$SUBLIME_PREFERENCES_HOME"
echo "Done."

sh $REPO_DIR/osx.sh