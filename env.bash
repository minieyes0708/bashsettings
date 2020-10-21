export PATH=$PATH:~/bin

function get_git_branch_name {
	branch_name=$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')

	if [[ ! -z "$branch_name" ]]; then
		echo "\[\e[1;36m\] (${branch_name}) \[\e[0m\]"
	else
		echo ""
	fi
}
function prompt_func() {
	PS1="
\[\033[m\]|\[\033[1;35m\]\t\[\033[m\]|\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\w]\[\e[0m\]$(get_git_branch_name)
> "
}
PROMPT_COMMAND=prompt_func

export REPO=/g/IMAGE/MD/TL1_Private/Software/minieyes/repo
export http_proxy=http://nvt02863:20Q3toolteam@172.20.10.210:80
export SSH_MINILIBRARY_URL=ssh://git@git.novatek.com.tw:7999/md_tl1/minilibrary.git
