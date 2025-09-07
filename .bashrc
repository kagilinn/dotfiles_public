#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LOADED_PROFILES="${LOADED_PROFILES} <.bashrc>"

[ -r ~/.bash_aliases ] && source ~/.bash_aliases


# git-prompt
export GIT_PS1_SHOWUPSTREAM='auto'
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_DESCRIBE_STYLE='branch'
export GIT_PS1_SHOWCOLORHINTS=true
if [ -r ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
fi
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
		local body='\h:\W \u'
	else
		# SSH 接続でない場合, カレントディレクトリの表示のみ.
		local body='\W'
	fi

	# screen 用に, プロンプトに動作中のコマンド名を埋め込む.
	if [ $TERM == 'screen' ]; then
		local screen='\[\ek\e\\\]'
	fi
	__git_ps1 "$screen$status_header$body" '\$ '
}
PROMPT_COMMAND='prompt_command_function'

# git-completion
if [ -r ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

[ -r ~/.bashrc_local ] && source ~/.bashrc_local

export LOADED_PROFILES="${LOADED_PROFILES} </.bashrc>"
