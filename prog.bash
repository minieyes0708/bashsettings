prog()
{
	cat ~/.bashrc.d/user/programs.txt | fzf | bash
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
