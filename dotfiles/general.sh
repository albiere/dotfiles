export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%F %T "
export EDITOR=vim
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
