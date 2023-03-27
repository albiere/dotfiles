[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash

if which fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude ".git" .'
elif which rg >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='rg --files'
else
  export FZF_DEFAULT_COMMAND='find . -name .git -prune -o -print'
fi

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--height 100% --preview='test -d {} || bat --style=numbers,changes --color=always {} | head -500'"
