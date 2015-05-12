echo "Interactively copying the config dotfiles from repo into the home directory!"

REPO_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for dotfile in $REPO_DIR/.{aliases,bash_profile,gitconfig,gitignore_global}; do
    cp -i $dotfile ~
done

echo "Configuring OS X."
sh osx.sh