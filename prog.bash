prog()
{
	local prog=$(cat ~/.bashrc.d/user/programs.txt | fzf)
	cd $(dirname $prog)
	START "" "$prog"
	cd -
}
p()
{
	prog
}
