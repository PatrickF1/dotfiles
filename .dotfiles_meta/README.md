# dotfiles
A collection of my configuration and bootstrap files for `bash`, `fish`, `git`, `iTerm2`, `Sublime Text 3`, and even `brew`, `Mac OS settings`, and `Mac OS applications`.  Includes scripts to automate installation. These settings are for me, and I doubt they will work well for anyone else's workflow and preferences. That said, I did my best to make my dotfiles as lightweight and sensible as possible so they may be worth forking as a starting point for your dotfiles.

## Assumptions
- your primary, day-to-day shell is the `fish` shell
- you only use macOS
- you are proficient in `git`
- you keep your code in `~/Code`


## Installing
All the dotfiles are managed through git. See this very excellent [Atlassian article](https://www.atlassian.com/git/tutorials/dotfiles) for an idea on how this works, but the basic idea is that we will set our `git` working directory as the home directory so files are tracked, updated, and managed in place with `git` without any symlinking.
```sh
cd ~
mkdir -p Code
cd Code
git clone https://github.com/patrickf3139/dotfiles
cd dotfiles/.dotfiles_meta
git reset --hard --work-tree="$HOME"
brew bundle
fish install_shell_utilities.fish
fish configure_apps.fish
sh configure_osx.sh
```
Be sure to run the commands in this order, as some commands have dependencies on things installed by earlier commands.

Scratch pad as I need to rewrite the readme
git config --local status.showUntrackedFiles false
echo "gitdir: /Users/patrick.fong/Code/dotfiles/.git" > "$HOME/.git"
git reset --hard to get changes to materialize
how to propogate changes after editing dotfiles to ~
warnings about git add -A and deleting untracked files