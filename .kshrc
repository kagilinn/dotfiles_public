export LOADED_PROFILES="${LOADED_PROFILES} .kshrc"

if type rbenv > /dev/null 2>&1
then
    eval "$(rbenv init - --no-rehash ksh)"
fi

# vi モード. 補完は ESC => \ で.
#set -o vi

# Emacs モード. 補完は ESC => ESC で.
set -o emacs

cd () {
    command cd "$@" && printf "\e]0;ksh - ${PWD/#$HOME/\~}\a"
}
printf "\e]0;ksh - ${PWD/#$HOME/\~}\a"

PS1='
${PWD##*/}$ '

alias ls='ls ${LS_COLOR_OPTION_FLAG}'
alias la='ls -a ${LS_COLOR_OPTION_FLAG}'
alias ll='ls -l ${LS_COLOR_OPTION_FLAG}'
alias lla='ls -al ${LS_COLOR_OPTION_FLAG}'

alias mv='mv -i'
alias rm='rm -i'

alias vim='vim -p'
alias view='vim -R -p'

alias grep='grep --color=auto'
alias fgrep='grep --color=auto -F'
alias egrep='grep --color=auto -E'

alias rcs-checkout='co -l'
alias rcs-commit='ci -l'
alias rcs-init='mkdir -v RCS'

alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdft='git difftool'
alias gf='git fetch'
alias gloga='git log --oneline --decorate --graph --all'
alias gmt='git mergetool'
alias grs='git restore'
alias grst='git restore --staged'
alias gst='git status'
alias gsta='git stash save'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsw='git switch'
alias gswc='git switch --create'
