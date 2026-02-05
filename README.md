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

### Example of Corresponding Directories (packages)

Example of how Stow symlinks will be created based on corresponding directories:

```
dotfiles/
├── vim/.vimrc  →  ~/.vimrc
├── prettier/.prettierrc  →  ~/.prettierrc
├── bin/bin/some-script  →  ~/bin/some-script
├── bash/.config/bash/prompt.sh  →  ~/.config/bash/prompt.sh
```

To further explain:

- If a package contains a **file**, Stow will create a symlink to that file in your `$HOME`.
- If a package contains a **subdirectory**, the corresponding directory (and any parent directories) must already exist in your `$HOME` before running Stow.
  - For more details, see [Packages Containing Directories](#packages-containing-directories) below.

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

### Packages Containing Directories

Some packages include directories that must exist in your home folder before Stow can link the contents.

For example, the bin package contains scripts intended for ~/bin.

Before running:

```sh
cd ~/dotfiles
stow bin
```

you must ensure that the target directory exists:

```sh
mkdir -p ~/bin
```

This is because **GNU Stow only creates symlinks for files**; it does not automatically create the target directory itself or any nested subdirectories.

Once the corresponding directories exists, Stow will correctly link the files the package into it.

> ⓘ **Tip**
> For packages that install into directories like ~/bin, ~/local/share/fonts, or ~/.config, always create the corresponding directories first. Stow will then handle linking the files correctly.

> ⓘ **Note**
> The bash package does not directly replace your existing `~/.bashrc`.
> See [Bash Package](#bash-package) below — it requires a small manual step
> to source the configuration.

## Uninstall a Package

To remove all of the symlinks for a package created by GNU Stow:

```sh
cd ~/dotfiles
stow -D vim # Example: Delete the symlinks for the vim package
```

> ⓘ **Note**
> If you created corresponding directories for a package before using Stow to create symlinks, you could optionally remove them.

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

#### Bash Submodules Explained

All the files in the bash package live in `~/.config/bash`.

I refer to the `.sh` files in that directory as "submodules" of the bash package.

This keeps your distro-provided `~/.bashrc` intact while allowing your dotfiles to be sourced cleanly.

After updating your `~/.bashrc`, install with:

```sh
cd ~/dotfiles
stow bash
source ~/.bashrc # Source to run (dotfiles) block on stowed submodules
```

#### Opting Out of Bash Submodules

The bash package loads submodules via scripts and a loop.

You can easily opt-out of submodules by defining your own values for `$BASH_SUBMODULES`.

##### Example

Here is an example of opting out of the use of `~/dotfiles/bash/.config/bash/prompt.sh`.

```sh
# File: `~/.bashrc`

export BASH_SUBMODULES="aliases exports funcs" # note, prompt is not listed
```

If you do not `export BASH_SUBMODULES` in your environment, all submodules will be enabled by default.

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

## Vim Package

### Optional Tooling

On write, BASH files will try to run `shellcheck` as a linter.

```sh
# Install linter so :w does not complain
sudo apt install shellcheck
```
#### Code Formatter Keybinds

Keybind: `Leader + f`

Using this keybind will call a formatter based on the filetype.

The formatter will format the code and save the file before redrawing the vim buffer.

The following formatters must be installed and in your $PATH if you wish to use this keybind.

```sh
# JS, TS, HTML, CSS, JSON files use Prettier
npm install -g prettier
prettier --version # Verify install success

# Python files use Black
sudo apt install pipx
pipx ensurepath
source ~/.bashrc
pipx install black
black --version # Verify install success

# Go files will use gofmt from the standard library

# BASH files will use shfmt
sudo apt install shfmt
```

Keybind: `Leader + F`

Using this keybind will toggle format on save.

The status bar in vim will show if it is on.
