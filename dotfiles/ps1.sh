# LIST COLORS
# for code in {0..255}
# do echo -e "\e[38;5;${code}m"'\\e[38;5;'"$code"m"\e[0m"
# done

KUBE_CONTEXT=$(kubectl config current-context | xargs printf "(k8s:%s)")
GIT_BRANCH=$(__git_ps1 '(git:%s)')

PS1="\n\w\n$ "
export PS1="\n\[\e[0;33m\]\w \[\e[38;5;13m\]\$KUBE_CONTEXT \[\e[0;91m\]\$GIT_BRANCH\[\e[0;96m\]\n$ \[\e[0m\]"
