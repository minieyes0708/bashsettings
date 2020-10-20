_fzf_compgen_path() {
	fd --hidden --follow --exclude ".git" --exclude ".svn" . "$1"
}
_fzf_compgen_dir() {
	fd --type d --hidden --follow --exclude ".git" --exclude ".svn" . "$1"
}

