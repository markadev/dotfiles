# Executed when an interactive bash shell is opened or bash is invoked remotely
#echo ".bashrc"

BASHRC_SOURCED=yes

# Source .profile if not already included
[ -n "${CONFIG}" ] || . "${HOME}/.profile"

# If not running interactively, don't do anything
[ -z "${PS1}" ] && return

# Include our bashrc parts
for F in ${CONFIG}/bashrc.d/*.sh; do
	if [ -r "$F" ]; then . "$F"; fi
done
