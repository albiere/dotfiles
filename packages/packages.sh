#!/bin/bash

# Brew packages
brew update
brew install \
  bash-completion \
  vim \
  tmux \
  curl \
  wget \
  nmap \
  watch \
  fd \
  fzf \
  bat

# Tmux package manager
if [ -d "~/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Instal FZF
if which fd >/dev/null 2>&1; then
  /usr/local/opt/fzf/install
fi
