# GENERAL
alias ls='ls -Glh'
alias lsa='ls -Glha'
alias reload='source ~/.bash_profile'
alias h='history'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# DF
alias df='df -h'

# DUMB
alias kubect='kubectl'

function ctags_ruby {
  ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
}
