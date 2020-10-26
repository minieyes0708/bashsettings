vifm()
{
    if [ -f ~/.vifm/lastdir ]; then
        rm ~/.vifm/lastdir
    fi
    $VIFM_EXE_PATH "$@"
    if [ -f ~/.vifm/lastdir ]; then
        cd `cat ~/.vifm/lastdir`
		rm ~/.vifm/lastdir
    fi
}
