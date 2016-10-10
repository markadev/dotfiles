# Executed when logging in
#echo ".profile"

umask 022

export CONFIG="${HOME}/.config"
export LESSHISTFILE=-

# Include our profile parts
for F in ${CONFIG}/profile.d/*.sh; do
	if [ -r "$F" ]; then . "$F"; fi
done

# XXX get rid of this, but I think vim config depends on it ATM
export HOSTNAME=`hostname -s`

case `uname` in
Linux)
	# Python path
	export PATH="${HOME}/.local/bin:${PATH}"
	;;
Darwin)
	;;
esac

export PATH="${HOME}/bin:${PATH}"

if [ "${PS1}" -a "${BASH_VERSION}" ]; then
	# We're running an interactive bash shell
	. ${HOME}/.bashrc
fi
