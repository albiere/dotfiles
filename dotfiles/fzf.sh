[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if which fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude ".git" .'
elif which rg >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='rg --files'
else
  export FZF_DEFAULT_COMMAND='find . -name .git -prune -o -print'
fi
