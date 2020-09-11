export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%F %T "
export EDITOR=vim

set -o vi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
