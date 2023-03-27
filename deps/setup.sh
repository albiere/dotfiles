#!/bin/bash

RED="31"
GREEN="32"
BOLDGREEN="\033[1;${GREEN}m"
BOLDRED="\033[1;${RED}m"
ENDCOLOR="\033[0m"

# helper functions
progress_message() {
  echo -e "${BOLDGREEN}> $1${ENDCOLOR}"
}

error_message() {
  echo -e "${BOLDRED}> $1${ENDCOLOR}" >> /dev/stderr
}

execute_command() {
  progress_message "${2}"

  error=$($1 2>&1)

  if [ $? -eq 0 ]; then
    progress_message "${2}... DONE"
  else
    error_message "${2}... FAIL"
    printf "%s$error\n"
  fi
}

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
  progress_message "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Brew packages
PACKAGES=(
  bash-completion
  nvim
  tmux
  curl
  wget
  nmap
  watch
  fd
  fzf
  bat
  starship
  rg
  autojump
  tree
)

execute_command "brew update --quiet" "Updating list of homebrew packages..."
execute_command "brew install --quiet ${PACKAGES[*]}" "Installing homebrew packages..."

# Tmux package manager
if [ -d "~/.tmux/plugins/tpm" ]; then
  execute_command "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm" \
    "Installing Tmux Package Manager..."
fi

# Install FZF
if which fd >/dev/null 2>&1; then
  execute_command "/usr/local/opt/fzf/install --xdg --completion --key-bindings --no-update-rc --no-bash --no-zsh --no-fish" \
    "Installing key-bindings and fuzzy completion for FZF..."
fi
