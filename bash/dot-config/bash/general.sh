export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%F %T "
export EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME=base16

set -o vi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
