vifm()
{
    if [ -f ~/.vifm/lastdir ]; then
        rm ~/.vifm/lastdir
    fi
    winpty /d/minieyes_chen/software/vifm-w64-se-0.11-binary/vifm.exe "$@"
    if [ -f ~/.vifm/lastdir ]; then
        cd `cat ~/.vifm/lastdir`
		rm ~/.vifm/lastdir
    fi
}
