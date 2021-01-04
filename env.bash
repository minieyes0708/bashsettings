export PATH=$PATH:~/bin

if [ "$USERDOMAIN" == "NOVATEK" ]; then
    export PYTHONPATH='.;D:\minieyes_chen\program\python'
fi

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
