if [ -d "~/.bashrc.d" ]; then
	for file in $(ls ~/.bashrc.d); do
		fullfile="~/.bashrc.d/$file"
		if [ -r "$fullfile" ] && [ "$file" != 'deprecated' ]; then
			. $fullfile
		fi
	done
fi

source ~/pretty-git-for-bash/bash_pretty_git
