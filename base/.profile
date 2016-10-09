# Executed when logging in
#echo ".profile"

umask 022

export CONFIG="${HOME}/.config"
export LESSHISTFILE=-

# Include our profile parts
for F in ${CONFIG}/profile.d/*.sh; do
	if [ -r "$F" ]; then . "$F"; fi
done

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

# Host specific options
case "${HOSTNAME}" in
cactus-vm)
	export SSL_CERT_DIR="/etc/ssl/certs:${HOME}/.config/certs"
	export SSH_ASKPASS="/usr/bin/x11-ssh-askpass"
	#. ${CONFIG}/bash/ssh-agent.sh
	;;
*)
	;;
esac


if [ "${PS1}" -a "${BASH_VERSION}" ]; then
	# We're running an interactive bash shell
	. ${HOME}/.bashrc
fi
