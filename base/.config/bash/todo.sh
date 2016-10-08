# Print a TODO list

if test -t 1; then
	if [ -f ~/TODO ]; then
		cat ~/TODO
	fi
fi
