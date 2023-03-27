# Dotfiles

## Setup

My dotfiles are managed by [stow](https://www.gnu.org/software/stow/) and should work on any MacOS. You can leverage the `deps/setup.sh` script to install `stow` and other dependecies.
To make things easier, a `Makefile` is provided and includes 3 targets:

```bash
make # Run stow and symlink dotfiles to the right place
make delete # Delete all symlinks
make deps # Install dependencies like stow and others.
```

## Nvim

My nvim configuration is set up in lua and plugins are managed via [Packer](https://github.com/wbthomason/packer.nvim). In order to install plugins, just run `:PackerSync` and everything should be configured properly.
