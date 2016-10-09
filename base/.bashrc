# Executed when an interactive bash shell is opened or bash is invoked remotely
#echo ".bashrc"

# Source .profile if it hasn't been sources (scp or ssh running a command)
if [ -z "${CONFIG}" ]; then
	. ${HOME}/.profile
fi

# Command aliases
alias bgrep="grep --exclude='*.[ado]' --exclude='tags' --exclude-dir='.svn' --exclude-dir='.git'"
alias nohist="export HISTFILE=/dev/null"

complete -f -X '*.o' vi vim
complete -d cd pushd

# Shell variables
unset IGNOREEOF MAILCHECK PROMPT_COMMAND
unset command_not_found_handle
export PS1="\h> "


case "${OSTYPE}" in
linux-*)
	alias ls="ls --color=auto"
	;;
darwin*)
	export CLICOLOR=1
	;;
esac


case "${HOSTNAME}" in
cactus-vm)
	. virtualenvwrapper.sh
	. ${CONFIG}/bash/marks.sh
	. ${CONFIG}/bash/todo.sh
	;;
*)
	;;
esac
