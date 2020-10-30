_fzf_compgen_path() {
	fd --max-depth 1 --hidden --follow --exclude ".git" --exclude ".svn" --exclude "__history" --exclude ".vscode" --exclude ".vs" . "$1"
}
_fzf_compgen_dir() {
	fd --type d --max-depth 1 --hidden --follow --exclude ".git" --exclude ".svn" --exclude "__history" --exclude ".vscode" --exclude ".vs" . "$1"
}
fav() {
	local IFS=:
	read -r -a top_dirs <<< $FZF_TOP_DIRS
	read -r -a fixed_dirs <<< $FZF_FIXED_DIRS

	local target_dir=$(
		{
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
				local IFS=$'\n'
				cd "${target_dir}"
				for dir in $(fd --max-depth 1 --type d); do
					echo "${target_dir}${dir}"
				done
			} | fzf --query "$1"
		)
	fi

	if [[ ! -z ${target_dir} ]]; then
		cd "${target_dir}"
	fi
}
export FZF_COMPLETION_TRIGGER=''
