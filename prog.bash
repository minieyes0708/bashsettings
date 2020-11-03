prog()
{
	local prog=$(cat ~/.bashrc.d/user/programs.txt | fzf)
	if [[ ! -z "$prog" ]]; then
		cd $(dirname $prog)
		START "" $prog
		cd -
	fi
}
p()
{
	prog
}
progedit()
{
	gvim ~/.bashrc.d/user/programs.txt&
}
pe()
{
	progedit
}
