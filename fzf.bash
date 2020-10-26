_fzf_compgen_path() {
	fd --hidden --follow --exclude ".git" --exclude ".svn" --exclude "__history" --exclude ".vscode" --exclude ".vs" . "$1"
}
_fzf_compgen_dir() {
	fd --type d --hidden --follow --exclude ".git" --exclude ".svn" --exclude "__history" --exclude ".vscode" --exclude ".vs" . "$1"
}
fav() {
	local top_dirs=(
		"/j//"
		"/k//"
		"/l//"
		"/m//"
		"/n//"
	)
	local fixed_dirs=(
		"/d/Downloads"
		"/c/Users/minieyes/Desktop"
	)

	local target_dir=$(
		{
			local IFS=:
			for dir in ${top_dirs[*]}; do
				echo "${dir}"
			done
			for dir in ${fixed_dirs[*]}; do
				echo "${dir}"
			done
		} | fzf --query "$1"
	)

	if [[ ! -z ${target_dir} ]] && [[ ${top_dirs[*]} == *"${target_dir}"* ]]; then
		target_dir=$(
			{
				cd "${target_dir}"
				for dir in $(fd --max-depth 1 --type d); do
					echo "${target_dir}/${dir}"
				done
			} | fzf --query "$1"
		)
	fi

	if [[ ! -z ${target_dir} ]]; then
		cd "${target_dir}"
	fi
}

