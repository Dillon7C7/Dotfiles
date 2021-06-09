# Dillon's dotfiles

This is a just a little repo for my dotfiles :)
I plan to devote some time to seriously ricing my config in the future, but for now I am satisfied.

## Installation

```
mkdir -p ~/.cache/dotfiles-temp ~/.config/dotfiles.git
git clone --separate-git-dir=$HOME/.config/dotfiles.git https://github.com/Dillon7C7/Dotfiles $HOME/.cache/dotfiles-temp
cp -rT ~/.cache/dotfiles-temp ~
rm -rf ~/.cache/dotfiles-temp
. ~/.bash_aliases
dotgit config status.showUntrackedFiles no
```

`dotgit` here is an alias for git, with a few key differences:
- `$HOME` serves as the working tree directory, and
- `$HOME/.config/dotfiles.git/` serves as the git repository directory

This allows you to update your dotfiles from anywhere on your filesystem.

## Example

```
dotgit status
dotgit add .zprofile
dotgit commit -m "Add zsh login shell config, .zprofile"
dotgit push origin main
```

## Caveats

- The above commands, and thus the provided install script, will overwrite your dotfiles!!! Use at your own risk.
- Tested on Centos 8 and Fedora 31 machines; things may or may not work on other \*nix systems or distros.
- Program versions are not taken into consideration; some configs may break (on older systems in particular).
- For the most part, the dotfiles are copied to/littered throughout the first level of your `$HOME` directory, so:
	- No attention is paid to the XDG Base Directory Specification. This will change in the future.
	- To reiterate, any of the tracked files in your `$HOME` will be overwritten!
- Many of these files use my own custom key bindings and shortcuts, so a bit of study is recommended before using.
- The optional install script may not be completely robust, beware!

## Tips

### Automate this process
I have written a (POSIX-compliant) script that automates the **Installation** steps.

#### Usage:
```
curl -LO https://raw.githubusercontent.com/Dillon7C7/Dotfiles-bootstrap/main/dotfiles-install
. dotfiles-install
```

The script will source ~/.bash\_aliases, thereby modifying your current environment.\
**Make sure git is installed prior to using!**\
:star: Feel free to git clone and contribute to the Dotfiles-bootstrap repo!

### Machines with different requirements or restrictions

You can use separate branches for different machines or special cases.
For example, a branch for a machine that uses the i3 tiling window manager could additionally track the `$HOME/.config/i3/config` and `$HOME/.config/i3status/config` files:

```
dotgit checkout -b work_dev_box
dotgit add $HOME/.config/i3/config
dotgit add $HOME/.config/i3status/config
dotgit commit -m "Add i3 config for work development machine"
dotgit push origin work_dev_box
```
Right now, the main branch holds my most typical setup, which works for most of the machines I use.

## Additional Information

### Why clone to a temporary directory?

Cloning the repo directly into your home directory will fail if it is not empty:

```
git clone --separate-git-dir=$HOME/.config/dotfiles.git https://github.com/Dillon7C7/Dotfiles ~    # Will most likely fail.
```

This is why we first clone into `$HOME/.cache/dotfiles-temp`, and copy the directory contents to `$HOME`.
