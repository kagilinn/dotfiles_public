export LOADED_PROFILES="${LOADED_PROFILES} .bash_aliases"

alias cp='cp -i'
alias ghc='stack ghc --'
alias la='ls -a $LS_COLOR_OPTION_FLAG'
alias ll='ls -l $LS_COLOR_OPTION_FLAG'
alias lla='ls -al $LS_COLOR_OPTION_FLAG'
alias ls='ls $LS_COLOR_OPTION_FLAG'
alias mv='mv -i'
alias rm='rm -i'
alias view='view -p'
alias vim='vim -p'

# 対話からの grep はバイナリ無視, 色付き.
alias egrep='egrep -I --color'
alias fgrep='fgrep -I --color'
alias grep='grep -I --color'

# RCS の分かりやすさ優先コマンド.
alias rcscheckout='co -l'
alias rcscommit='ci -l'
alias rcsinit='mkdir -v RCS'

# git 系 alias
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gd='git diff'
alias gdca='git diff --cached'
alias gf='git fetch'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gpsup='git push --set-upstream origin `git symbolic-ref --short HEAD`'
alias gst='git status'
alias gsta='git stash save'
alias gstl='git stash list'
alias gstp='git stash pop'
