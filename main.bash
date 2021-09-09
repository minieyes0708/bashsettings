if [ -d "$HOME/.bashrc.d" ]; then
    for file in $(ls $HOME/.bashrc.d); do
        fullfile="$HOME/.bashrc.d/$file"
        if [ ! -d "$fullfile" ] && [ -r "$fullfile" ] && [ "$file" != 'main.bash' ] && [ "$file" != 'tags' ]; then
            . $fullfile
        fi
    done
fi
