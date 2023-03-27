# Dotfiles

## Setup

My dotfiles are managed by [stow](https://www.gnu.org/software/stow/) and should work on any MacOS. You can leverage the `deps/setup.sh` script to install `stow` and other dependecies.
To make things easier, a `Makefile` is provided and includes 3 targets:

```bash
make # Run stow and symlink dotfiles to the right place
make delete # Delete all symlinks
make deps # Install dependencies like stow and others.
```

### --dotfiles option

The current setup uses the `--dotfiles` argument when issuing `stow` commands. Here is what the documentation says about it:

> --dotfiles
>
> Enable special handling for "dotfiles" (files or folders whose name begins with a period) in the package directory. If this option is enabled, Stow will add a preprocessing step for each file or folder whose name begins with "dot-", and replace the "dot-" prefix in the name by a period (.). This is useful when Stow is used to manage collections of dotfiles, to avoid having a package directory full of hidden files.
>
> For example, suppose we have a package containing two files, stow/dot-bashrc and stow/dot-emacs.d/init.el. With this option, Stow will create symlinks from .bashrc to stow/dot-bashrc and from .emacs.d/init.el to stow/dot-emacs.d/init.el. Any other files, whose name does not begin with "dot-", will be processed as usual.

This option does not work as intended for directories inside packages, only files. To make it work for directories and continue using it for files, hidden symlinks that point to the `dot-` directories alongside `.stow-local-ignore` files have been created inside each package that contains directories.

## Nvim

My nvim configuration is set up in lua and plugins are managed via [Packer](https://github.com/wbthomason/packer.nvim). In order to install plugins, just run `:PackerSync` and everything should be configured properly.
