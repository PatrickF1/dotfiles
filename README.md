# dotfiles
A collection of my configuration and bootstrap files for `bash`, `fish`, `git`, `iTerm2`, `Sublime Text 3`, and even `brew` and `Mac OS`. Assumes your primary shell is the `fish` shell. Includes scripts to automate installation.
## Installing
```
brew bundle
fish install.sh
sh osx.sh
```
After installing, do not move the location of the `dotfiles` repository on your machine or symlinks and other references will break. If you must move the location of the `dotfiles` repository, re-run `fish install.sh` after moving.