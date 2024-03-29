# Executed when logging in
#echo ".profile"

umask 022

export CONFIG="${HOME}/.config"
export LESSHISTFILE=-

# Include our profile parts
for F in ${CONFIG}/profile.d/*.sh; do
	if [ -r "$F" ]; then . "$F"; fi
done

case `uname` in
Linux)
	# Python path
	export PATH="${HOME}/.local/bin:${PATH}"
	;;
Darwin)
	# Python path
	export PATH="${HOME}/Library/Python/2.7/bin:${PATH}"
	;;
esac

export PATH="${HOME}/bin:${PATH}"

if [ "${PS1}" -a "${BASH_VERSION}" -a -z "${BASHRC_SOURCED}" ]; then
	# We're running an interactive bash shell
	. ${HOME}/.bashrc
fi
