export LOADED_PROFILES="${LOADED_PROFILES} .kshrc"

if type rbenv > /dev/null 2>&1
then
    eval "$(rbenv init - --no-rehash ksh)"
fi

# vi モード. 補完は ESC => \ で.
#set -o vi

# Emacs モード. 補完は ESC => ESC で.
set -o emacs

prompt_command () {
    cwd="${PWD/#$HOME/\~}"
    printf "\e]0;ksh - %s\a\n%s$ " "${cwd##*/}" "${cwd}"
}
PS1='$(prompt_command)'

alias ls='ls ${LS_COLOR_OPTION_FLAG}'
alias la='ls -a ${LS_COLOR_OPTION_FLAG}'
alias ll='ls -l ${LS_COLOR_OPTION_FLAG}'
alias lla='ls -al ${LS_COLOR_OPTION_FLAG}'

alias mv='mv -i'
alias rm='rm -i'

alias vim='vim -p'
alias view='vim -R -p'

alias grep='grep --color=auto -I'
alias fgrep='grep --color=auto -I -F'
alias egrep='grep --color=auto -I -E'

if type co > /dev/null 2>&1
then
    if type ci > /dev/null 2>&1
    then
        alias rcs-init='mkdir -v RCS'
        alias rcs-checkout='co -l'
        alias rcs-commit='ci -l'
    fi
fi

alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdft='git difftool'
alias gf='git fetch'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gmt='git mergetool'
alias gpsup='git push --set-upstream origin $(git symbolic-ref --short HEAD)'
alias grs='git restore'
alias grst='git restore --staged'
alias gst='git status'
alias gsta='git stash save'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsw='git switch'
alias gswc='git switch --create'
