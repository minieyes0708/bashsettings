vifm()
{
    if [ -f ~/.vifm/lastdir ]; then
        rm ~/.vifm/lastdir
    fi
    /l/vifm-w64-se-0.11-binary/vifm.exe "$@"
    if [ -f ~/.vifm/lastdir ]; then
        cd `cat ~/.vifm/lastdir`
		rm ~/.vifm/lastdir
    fi
}
