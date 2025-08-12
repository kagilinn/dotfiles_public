LOADED_PROFILES="${LOADED_PROFILES} .profile"
export LOADED_PROFILES

[ -r ~/.profile_local ] && . ~/.profile_local

PATH="${PATH}:${HOME}/bin"
export PATH
