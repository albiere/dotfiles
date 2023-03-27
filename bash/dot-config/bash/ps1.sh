# LIST COLORS
# for code in {0..255}
# do echo -e "\e[38;5;${code}m"'\\e[38;5;'"$code"m"\e[0m"
# done

# function kube_context {
#   echo $(kubectl config current-context 2>/dev/null | xargs printf "(k8s:%s)")
# }

# function git_branch {
#   echo $(__git_ps1 '(git:%s)')
# }

# PS1="\n\w\n$ "
# export PS1="\n\[\e[0;33m\]\w \[\e[38;5;13m\]\$(kube_context)\[\e[0;91m\]\$(git_branch)\[\e[0;96m\]\n$ \[\e[0m\]"

eval "$(starship init bash)"

