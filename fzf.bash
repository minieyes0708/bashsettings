_fzf_compgen_path() {
	fd --hidden --follow --exclude ".git" --exclude ".svn" --exclude "__history" --exclude ".vscode" --exclude ".vs" . "$1"
}
_fzf_compgen_dir() {
	fd --type d --hidden --follow --exclude ".git" --exclude ".svn" --exclude "__history" --exclude ".vscode" --exclude ".vs" . "$1"
}
fav() {
	local top_dirs=(
		"/d/minieyes_chen//"
		"/d/minieyes_chen/program//"
		"/g/IMAGE/MD/TL/Software/minieyes//"
		"/g/IMAGE/MD/TL1_Private/Software/minieyes//"
	)
	local fixed_dirs=(
		"/g/MD/Projects/IVE"
		"/g/MD/Projects/IVE/Software/IVE4主程式"
		"/g/MD/工作報告/周報/TL/陳怡哲"
		"/g/MD/FAE Related/China_FAE"
		"/g/MD/FAE Related/China_FAE/Tool/IVE InstallPack_20171025"
		"/g/簡報資料公用區/工程類"
		"/d/minieyes_chen/doc/eDP"
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
