if [ -d "~/.bashrc.d" ]; then
	for file in $(ls ~/.bashrc.d); do
		fullfile="~/.bashrc.d/$file"
		if [ -r "$fullfile" ] && [ "$file" != 'main.bash' ]; then
			. $fullfile
		fi
	done
fi
