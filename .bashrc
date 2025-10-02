# vim: set tabstop=4 shiftwidth=4 noexpandtab :
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LOADED_PROFILES="${LOADED_PROFILES} <.bashrc>"

if type rbenv > /dev/null 2>&1
then
	eval "$(rbenv init - --no-rehash bash)"
fi

# git-prompt
export GIT_PS1_SHOWUPSTREAM='auto'
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_DESCRIBE_STYLE='branch'
export GIT_PS1_SHOWCOLORHINTS=true
PS1=''
prompt_command_function () {
	# 現時点での終了コードを保存.
	local status=$(echo ${PIPESTATUS[@]})

	# 終了コード.
	local status_header=''
	for s in $status; do
		if [ $s -ne 0 ]; then
			status_header="\[\e[31m\](${status// /|})\[\e[0m\]"
			break
		fi
	done

	if [[ -n "${SSH_CONNECTION}" || -n "${SSH_CLIENT}" ]]; then
		# SSH 接続の場合, ユーザ名やホスト名も表示.
		local body='[\h@\u]\W'

		# 端末のタイトルバーを指定.
		local term_title="\e]0;\h@\u\a"
	else
		# SSH 接続でない場合, カレントディレクトリの表示のみ.
		local body='\W'

		# 端末のタイトルバーを指定.
		local term_title="\e]0;${PWD/#$HOME/\~}\a"
	fi

	# screen 用に, プロンプトに動作中のコマンド名を埋め込む.
	if [ $TERM == 'screen' ]; then
		local screen='\[\ek\e\\\]'
	fi

	if type __git_ps1 > /dev/null 2>&1
	then
		__git_ps1 "$term_title$screen$status_header$body" '\$ '
	else
		PS1="$term_title$screen$status_header$body\$ "
	fi
}
PROMPT_COMMAND='prompt_command_function'

[[ -r ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -r ~/.bashrc_local ]] && source ~/.bashrc_local

export LOADED_PROFILES="${LOADED_PROFILES} </.bashrc>"
