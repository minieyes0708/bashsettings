prog()
{
	local prog=$(cat ~/.bashrc.d/user/programs.txt | fzf)
	if [[ ! -z "$prog" ]]; then
		$prog $*
	fi
}
p()
{
	prog $*
}
progedit()
{
	gvim ~/.bashrc.d/user/programs.txt&
}
pe()
{
	progedit
}
