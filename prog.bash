prog()
{
    local PROG=$(cat ~/.bashrc.d/user/programs.txt | fzf)
    $PROG $*
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
