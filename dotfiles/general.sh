export HISTTIMEFORMAT="%d/%m/%y %T "
export EDITOR=vim

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
