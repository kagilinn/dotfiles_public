#
# ~/.bash_profile
#
export LOADED_PROFILES="${LOADED_PROFILES} <.bash_profile>"

if [[ -z PROFILE_LOADED ]]
then
    [[ -r ~/.profile            ]] && source ~/.profile
    [[ -r ~/.bash_profile_local ]] && source ~/.bash_profile_local
    export PROFILE_LOADED="true"
fi
[[ -r ~/.bashrc             ]] && source ~/.bashrc

export LOADED_PROFILES="${LOADED_PROFILES} </.bash_profile>"
