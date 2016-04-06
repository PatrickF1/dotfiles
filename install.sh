echo "Installing files for current user."
echo "Interactively copying the dot files into the home directory."

REPO_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for dotfile in $REPO_DIR/.{aliases,bash_profile,gitconfig,gitignore_global}; do
    cp -i $dotfile ~
done

echo "Done. You must restart terminal or source the dot files before the changes to take effect."

sh $REPO_DIR/osx.sh