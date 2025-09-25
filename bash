// git branch

source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
COLOR_DEF='%f'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{33}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%1d${COLOR_DEF}${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '


// k8s
function iterm2_print_user_vars() {
  iterm2_set_user_var kubecontext $(kubectl config current-context)
}
