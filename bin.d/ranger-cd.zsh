ranger-cd () {
	emulate -L zsh
	() {
		local tmp
		exec < /dev/tty
		tmp=$(mktemp -t rcd.XXXXX) 
		$(which ranger) --choosedir="$tmp" ${@:-$(pwd)}
		[[ -s "$tmp" ]] && cd "$(cat $tmp)"
		rm -f "$tmp" &> /dev/null
		print -R $*
	} "$BUFFER"
	zle send-break
}
