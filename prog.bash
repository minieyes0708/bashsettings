prog()
{
    local PROG=$(cat ~/.bashrc.d/user/programs.txt | fzf)
    echo $PROG $* > ~/tmp.sh
    bash ~/tmp.sh
    rm ~/tmp.sh
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
