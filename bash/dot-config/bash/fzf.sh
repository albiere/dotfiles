eval "$(fzf --bash)"

export FZF_DEFAULT_OPTS='--style=full --preview "fzf-preview.sh {}" --bind "focus:transform-header:file --brief {}"'
