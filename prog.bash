prog()
{
	local prog=$(cat ~/.bashrc.d/user/programs.txt | fzf)
	START "" "$prog"
}
