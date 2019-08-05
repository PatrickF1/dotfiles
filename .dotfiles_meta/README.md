# dotfiles
A collection of my configuration and bootstrap files for `bash`, `fish`, `git`, `iTerm2`, `Sublime Text 3`, and even `brew`, `macOS settings`, and `Mac OS applications`.  Includes scripts to automate installation. These settings are for me, and I doubt they will work well for anyone else's workflow and preferences. That said, I did my best to make my dotfiles as lightweight and sensible as possible so they may be worth forking as a starting point for your dotfiles.

## Assumptions
- your primary, day-to-day shell is the `fish` shell
- you only use macOS
- you keep your code in `~/Code`
- you use Dropbox to backup settings for your apps (e.g. iTerm)

## Installing
Unlike most other dotfiles repos that use symlinks or `rsync` to manage your dotfiles, we will use git and only git. See this very excellent [Atlassian article](https://www.atlassian.com/git/tutorials/dotfiles) for an idea on how this works, though I diverge from the article a bit. The basic idea is that we will set our git working directory as the home directory so files are tracked, updated, and managed in place with git.
```sh
# clone the repo into the expected place (~/Code/dotfiles)
cd
mkdir -p Code/dotfiles
git clone https://github.com/patrickf3139/dotfiles ~/Code/dotfiles

# checkout all the files into your home directory  by making it the git working directory
git --git-dir=Code/dotfiles/.git --work-tree=. reset --hard

# run all the install scripts, which are located in .dotfiles_meta
cd .dotfiles_meta
brew bundle
fish install_shell_utilities.fish
fish configure_apps.fish
sh configure_osx.sh
```
I have provided a `dot` autoloaded fish function that you can use to perform git operations on your home directory without having to continually specify the `git-dir` and `work-tree` options.