# dotfiles

A collection of my configuration and bootstrap files for `bash`, `fish`, `git`, `iTerm2`, `Visual Studio Code`, and even `brew`, `macOS settings`, and `Mac OS applications`. Includes scripts to automate installation. These settings are for me, and I doubt they will work well for anyone else's workflow and preferences. That said, I did my best to make my dotfiles as lightweight and sensible as possible so they may be worth forking as a starting point for your dotfiles.

## Assumptions

- your primary, day-to-day shell is the `fish` shell
- you only use macOS
- you keep your code in `~/Code`
- you use Dropbox to backup settings for your apps (e.g. iTerm)

## Installing

Unlike most other dotfiles repos that use symlinks or `rsync` to manage your dotfiles, we will use git and only git. See this very excellent [Atlassian article](https://www.atlassian.com/git/tutorials/dotfiles) and [DistroTube tutorial](https://www.youtube.com/watch?v=tBoLDpTWVOM) for a primer, though this setup is a bit different. The basic idea is that this repository's directory structure mirrors `$HOME`'s directory structure when all the dotfiles exist in their proper place. By setting up this repository in this way, we will be able to set our git working directory to the home directory and checkout dotfiles directly into the directories they should go.

```sh
# clone the repo into the expected place (~/Code/dotfiles)
cd # start installation steps from home directory
mkdir -p Code/dotfiles
git clone https://github.com/patrickf1/dotfiles ~/Code/dotfiles

# checkout all the files into our home directory by making it the git working directory
git --git-dir=Code/dotfiles/.git --work-tree=. reset --hard

# hide untracked files when querying the status of the dotfiles repo
git --git-dir=Code/dotfiles/.git config --local status.showUntrackedFiles no

# run all the install scripts, which are located in .dotfiles_meta
cd Code/dotfiles/.dotfiles_meta
brew bundle
fish install_shell_utilities.fish
fish configure_apps.fish
fish configure_macos.fish
```

## Workflow for updating dotfiles

One advantage of this setup is that we effectively have two copies of the dotfiles, one that is active in our home directory, and one that contains only the tracked files in `~/Code/dotfiles` and is safe and easy to modify. The recommended way to modify our dotfiles is open up `~/Code/dotfiles` in our editor and make the changes there. Once our changes have been finalized and committed into git, navigate back to the home directory and do `git --git-dir=Code/dotfiles/.git --work-tree=. reset --hard` to checkout our changes and make them active.

To make git operations on the home directory dotfiles easier, we can use `dot`, an [autoloaded fish function](https://fishshell.com/docs/current/tutorial.html#autoloading-functions) that specifies the `git-dir` and `work-tree` options for us. For example, instead of the above command for checking out changes, we can simply execute `dot reset --hard`.

Be very careful about not running `dot add -A` on the home directory. To avoid accidentally committed sensitive files and folders, be sure to add them to `.gitignore`. Many common folders that don't make sense to track are already ignored.

# Specific instructions for updating

## VSCode extensions

Unfortunately, VSCode doesn't store the list of installed extensions in a file. That is why we store the list of installed extensions in `vsc_extensions.txt`. To update it, run

```fish
code --list-extensions > .dotfiles_meta/vsc_extensions.txt
```

## VSCode settings

VSCode doesn't support automatic syncing of the `settings.json` file that is friendly for dotfiles. As a result, we have to manually keep it in sync. After updating VSCode settings

1. open up the settings
2. click on Open Settings (JSON) on the top right
3. JSON sort the file
4. copy into the `settings.json` that is checked into this repo
