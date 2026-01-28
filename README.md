# Dotfiles

My dotfiles, managed with GNU Stow.

This repository contains my personal configuration files, organized as modular packages.

Each package can be easily installed using [GNU Stow](https://www.gnu.org/software/stow/).

---

## Prerequisites

- GNU Stow installed on your system:

```bash
# Debian / Ubuntu
sudo apt install stow

# Arch
sudo pacman -S stow

# Fedora
sudo dnf install stow
```

- Linux machine (not tested on macOS, but may work there too...)

## Repository Structure

Each top-level directory is a package that will be symlinked into your home directory.

Example:

```
dotfiles/
├── vim/.vimrc  →  ~/.vimrc
```

## Install a Package

Clone this repository into your home directory:

```sh
git clone https://github.com/CodeZea1ot/dotfiles.git ~/dotfiles
```

Navigate to this repository and install one or more packages using GNU Stow:

```sh
# Example: Install vim package after performing a dry-run

cd ~/dotfiles
stow -n -v vim # Optional dry-run 
stow vim # Example: Install the vim package
```

> ⚠️ **Warning**
>
> The bash package does not directly replace your existing `~/.bashrc`.
> See [Bash Package](#bash-package) below — it requires a small manual step
> to safely source the configuration.

## Uninstall a Package

To remove all of the symlinks for a package created by GNU Stow:

```sh
cd ~/dotfiles
stow -D vim # Example: Uninstall the vim package
```

## Bash Package

### Installation

The bash package aims to be as modular as possible.

To use the bash package, you must add this to your `~/.bashrc`:

```sh
# Load user bash config (dotfiles)
if [ -f "$HOME/.config/bash/bashrc" ]; then
  source "$HOME/.config/bash/bashrc"
fi
```

All the files in the bash package live in `~/.config/bash`.

This keeps your distro-provided `~/.bashrc` intact while allowing your dotfiles to be sourced cleanly.

After updating your `~/.bashrc`, finish installation with:

```sh
source ~/.bashrc
cd ~/dotfiles
stow bash
```

#### Opting Out of Bash Submodules

The bash package loads submodules via scripts and a loop.

To opt out of a submodule, just edit the loop in `~/dotfiles/bash/.config/bash/bashrc`.

##### Example 

Here is an example of opting out of the use of `~/dotfiles/bash/.config/bash/prompt.sh`.

```sh
# File: `~/dotfiles/.config/bash/bashrc

for file in aliases exports; do # "prompt" removed from the loop
  f="$HOME/.config/bash/$file.sh"
  [ -f "$f" ] && source "$f"
done
```

### Uninstallation

Remove the following block from your `~/.bashrc`:

```sh
# Load user bash config (dotfiles)
if [ -f "$HOME/.config/bash/bashrc" ]; then
  source "$HOME/.config/bash/bashrc"
fi
```

Then remove the bash package symlinks:

```sh
cd ~/dotfiles
stow -D bash
```

