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

One feature of this setup is that we keep two copies of the dotfiles: one rooted in `$HOME`, and one in `~/Code/dotfiles` (this is not a bare git repo). The former copy is our live version, actively read and used by our system. However, we do not usually want to directly modify the live dotfiles, as one mistake can break your environment and make it difficult to rectify that mistake. Furthermore, opening up `$HOME` in our editor is not ideal because we will end up loading many files we have no irrelevant files we have interest in editing. That's where the latter copy comes into play: it's an inert git repository that is safe to modify and contains exactly the dotfiles we care about.

To make running git operations on the home directory repo easy, we have a special command: `dot`, an [autoloaded fish function](https://fishshell.com/docs/current/tutorial.html#autoloading-functions) that wraps `git` with the `--git-dir` and `--work-tree` options set for us.

For most modifications, checkout a new branch, open up the repo in our editor and make the changes. Once our changes have been committed, navigate back to the home directory and do `dot reset --hard` to checkout our changes in the home repo and thus make them active. We may have to start a new session of fish if there were changes in `config.fish` for example. If the changes broke our environment, we can quickly revert them by running `dot reset --hard main` again.

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
