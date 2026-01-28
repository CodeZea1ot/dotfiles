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

## Installation

Clone this repository into your home directory:

```sh
git clone https://github.com/CodeZea1ot/dotfiles.git ~/dotfiles
```

Navigate to this repository and install one or more packages using GNU Stow:

```sh
cd ~/dotfiles
stow vim
```

## Uninstalling Packages

To remove all of the symlinks for a package created by GNU Stow:

```sh
cd ~/dotfiles
stow -D vim
```
