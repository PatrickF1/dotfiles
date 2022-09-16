# dotfiles

My configuration and bootstrap files for `bash`, `fish`, `git`, `iTerm2`, `Visual Studio Code`, and even `brew`, `macOS settings`, and the settings for some applications. Includes scripts to automate installation. These are my bespoke dotfiles and workflow and therefore are likely ill-suited for everyone else. That said, I did my best to make my dotfiles as lightweight and sensible as possible so they may be worth forking as a starting point for your dotfiles.

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

# hide untracked files so the output of git status is not overwhelming
git --git-dir=Code/dotfiles/.git config --local status.showUntrackedFiles no

# run all the install scripts, which are located in .dotfiles_meta
cd Code/dotfiles/.dotfiles_meta
brew bundle
fish install_shell_utilities.fish
fish configure_apps.fish
fish configure_macos.fish
```

## Workflow for updating dotfiles

One feature of this setup is that we keep two copies of the dotfiles, one rooted in `$HOME`, and one in `~/Code/dotfiles` (this is not technically a bare git repo). The former copy is our live version, actively being read and used by the system. However, we do not usually want to directly modify the live dotfiles. One mistake can break your workflow, making it difficult to rectify that mistake. Furthermore, opening up `$HOME` in our editor is not ideal because we will load way too many irrelevant files we don't want to edit. That's where the latter copy comes into play. The dotfiles stored as an inert git repository are safe to modify and easy to open up in our editor.

For most modifications to the dotfiles, checkout a new branch, open up the repo in our editor and make the changes. Once our changes have been finalized and committed into git, navigate back to the home directory and do `git --git-dir=Code/dotfiles/.git --work-tree=. reset --hard` to checkout our changes and make them active. To make git operations on the home directory dotfiles easier, we can use `dot reset --hard`, an [autoloaded fish function](https://fishshell.com/docs/current/tutorial.html#autoloading-functions) that specifies the `git-dir` and `work-tree` options for us. If the changes broke your workflow, you can quickly revert by checking out `main` and running `dot reset --hard` again.

Be very careful about not running `dot add -A` on the home directory. To avoid accidentally committed sensitive files and folders, be sure to add them to `.gitignore`. Many common folders that don't make sense to track are already ignored.

When adding new files, remember that untracked files are not shown by git status.

# Specific instructions for updating

## VSCode extensions

Unfortunately, VSCode doesn't store the list of installed extensions in a file. That is why we store the list of installed extensions in `vsc_extensions.txt`. To update it, run

```fish
code --list-extensions > .dotfiles_meta/vsc_extensions.txt
```

`configure_apps.fish` will install the extensions listed in the file.

## VSCode settings

VSCode doesn't support automatic syncing of the `settings.json` file that is friendly for dotfiles. As a result, we have to manually keep it in sync. After updating VSCode settings

1. open up the settings
2. click on Open Settings (JSON) on the top right
3. JSON sort the file
4. copy into the `settings.json` that is checked into this repo
