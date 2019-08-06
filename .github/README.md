# dotfiles
A collection of my configuration and bootstrap files for `bash`, `fish`, `git`, `iTerm2`, `Sublime Text 3`, and even `brew`, `macOS settings`, and `Mac OS applications`.  Includes scripts to automate installation. These settings are for me, and I doubt they will work well for anyone else's workflow and preferences. That said, I did my best to make my dotfiles as lightweight and sensible as possible so they may be worth forking as a starting point for your dotfiles.

## Assumptions
- your primary, day-to-day shell is the `fish` shell
- you only use macOS
- you keep your code in `~/Code`
- you use Dropbox to backup settings for your apps (e.g. iTerm)

## Installing
Unlike most other dotfiles repos that use symlinks or `rsync` to manage your dotfiles, we will use git and only git. See this very excellent [Atlassian article](https://www.atlassian.com/git/tutorials/dotfiles) for an idea on how this works, though this setup is a bit diffreent. The basic idea is that the repository's hierarchy mirrors structure of the home directory with all the dotfiles in their proper place. This allows us to set our git working directory to the home directory and checkout dotfiles directly into the directories they should go.
```sh
# clone the repo into the expected place (~/Code/dotfiles)
cd
mkdir -p Code/dotfiles
git clone https://github.com/patrickf3139/dotfiles ~/Code/dotfiles

# checkout all the files into our home directory  by making it the git working directory
git --git-dir=Code/dotfiles/.git --work-tree=. reset --hard

# run all the install scripts, which are located in .dotfiles_meta
cd .dotfiles_meta
brew bundle
fish install_shell_utilities.fish
fish configure_apps.fish
fish configure_macos.fish
```

## Workflow for updating dotfiles
One advantage of this setup is that we effectively have two copies of the dotfiles, one that is active in our home directory, and one that contains only the tracked files in `~/Code/dotfiles` and is safe and easy to modify. The recommended way to modify our dotfiles is open up `~/Code/dotfiles` in our editor (if you use Sublime Text you can open up the project `.dotfiles_meta/dotfiles.sublime-project`) and make the changes there. Once our changes have been finalized and committed into git, navigate back to the home directory and do `git --git-dir=Code/dotfiles/.git --work-tree=. reset --hard` to checkout our changes and make them active.

To make git operations on the home directory dotfiles easier, we can use `dot`, an autoloaded fish function that specifies the `git-dir` and `work-tree` options for us. For example, instead of the above command for checking out changes, we can simply execute `dot reset --hard`.

Be very careful about not running `dot add -A` on the home directory. To avoid accidentally committed sensitive files and folders, be sure to add them to `.gitignore`. Many common folders that don't make sense to track are already ignored.