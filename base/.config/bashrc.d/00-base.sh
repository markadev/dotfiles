# Command aliases
alias bgrep="grep --exclude='*.[ado]' --exclude='*.pyc' --exclude='*.class' --exclude='*.jar' --exclude=tags --exclude-dir=.svn --exclude-dir=.git --exclude-dir=.idea"
alias nohist="export HISTFILE=/dev/null"

complete -d cd pushd

# Shell variables
unset IGNOREEOF MAILCHECK PROMPT_COMMAND
unset command_not_found_handle
export PS1="\h> "

case "${OSTYPE}" in
darwin*)
	export CLICOLOR=1
	;;
esac
