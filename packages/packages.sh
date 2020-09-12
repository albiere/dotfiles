#!/bin/bash

# Brew packages
brew install \
  bash-completion \
  vim \
  tmux \
  curl \
  wget \
  nmap \
  watch \
  fd \
  fzf

# Tmux package manager
if [ -d "~/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Instal FZF
/usr/local/opt/fzf/install
