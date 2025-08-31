#
# ~/.bash_profile
#
export LOADED_PROFILES="${LOADED_PROFILES} <.bash_profile>"

[[ -r ~/.profile            ]] && source ~/.profile
[[ -r ~/.bash_profile_local ]] && source ~/.bash_profile_local
[[ -r ~/.bashrc             ]] && source ~/.bashrc

export LOADED_PROFILES="${LOADED_PROFILES} </.bash_profile>"
