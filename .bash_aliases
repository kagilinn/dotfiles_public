#
# ~/.bash_aliases
#

export LOADED_PROFILES="${LOADED_PROFILES} .bash_aliases"

alias cp='cp -i'
alias ls='ls ${LS_COLOR_OPTION_FLAG}'
alias la='ls -a ${LS_COLOR_OPTION_FLAG}'
alias ll='ls -l ${LS_COLOR_OPTION_FLAG}'
alias lla='ls -al ${LS_COLOR_OPTION_FLAG}'
alias mv='mv -i'
alias rm='rm -i'
alias view='vim -R -p'
alias vim='vim -p'

# 対話からの grep はバイナリ無視, 色付き.
alias egrep='grep -E -I --color=auto'
alias fgrep='grep -F -I --color=auto'
alias grep='grep -I --color=auto'

# RCS の分かりやすさ優先コマンド.
if type co > /dev/null 2>&1
then
    if type ci > /dev/null 2>&1
    then
        alias rcs-init='mkdir -v RCS'
        alias rcs-checkout='co -l'
        alias rcs-commit='ci -l'
    fi
fi

# git 系 alias
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

if type stack > /dev/null 2>&1
then
    alias ghc='stack ghc --'
fi
