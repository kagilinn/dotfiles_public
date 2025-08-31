export LOADED_PROFILES="${LOADED_PROFILES} .zshrc"

# Emacs 風操作モード.
bindkey -e
#bindkey '[3~' delete-char

if type rbenv > /dev/null 2>&1
then
    eval "$(rbenv init - --no-rehash zsh)"
fi

setopt always_last_prompt
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_remove_slash
setopt complete_in_word
setopt correct
setopt hist_ignore_all_dups
setopt list_types
setopt markdirs
setopt nobeep
setopt prompt_subst

function precmd_titlebar () {
    printf "\e]0;zsh - %s\a" ${PWD/#$HOME/~}
}

# 補完有効化.
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#zstyle ':completion:*:mv:*'
#zstyle ':completion:*:rm:*'

# バージョン管理システムの情報表示.
autoload -Uz vcs_info
function precmd_vcs_info() {
    vcs_info
}
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr   '+'
zstyle ':vcs_info:git:*' unstagedstr '*'

zstyle ':vcs_info:git:*' formats       ' (%b%u%c) '
zstyle ':vcs_info:git:*' actionformats ' (%b%u%c|%a) '

precmd_functions+=( precmd_titlebar )
precmd_functions+=( precmd_vcs_info )
export PROMPT='
ⓩ%1~$vcs_info_msg_0_%# '

alias ls='ls ${LS_COLOR_OPTION_FLAG}'
alias la='ls -a ${LS_COLOR_OPTION_FLAG}'
alias ll='ls -l ${LS_COLOR_OPTION_FLAG}'
alias lla='ls -al ${LS_COLOR_OPTION_FLAG}'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias grep='grep -I --color=auto'
alias fgrep='grep -F -I --color=auto'
alias egrep='grep -E -I --color=auto'
alias view='vim -R -p'
alias vim='vim -p'

alias rcs-init='mkdir -v RCS'
alias rcs-checkout='co -l'
alias rcs-commit='ci -l'

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
alias grh='git reset HEAD'
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
