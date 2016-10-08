# Executed when logging in
#echo ".profile"

# Cygwin Note:
#   mkpasswd -l -c -g -p /home > /etc/passwd
#   mkgroup -l -c > /etc/group

umask 022

export CONFIG="${HOME}/.config"
export BC_ENV_ARGS="${CONFIG}/bc"
export VIMINIT="source ${CONFIG}/vim/vimrc"
export SCREENRC="${CONFIG}/screenrc"
export LESSHISTFILE=-
export EDITOR=/usr/bin/vim
export HOSTNAME=`hostname -s`

# ~/usr paths
export PATH="${HOME}/usr/bin:${HOME}/usr/sbin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/usr/lib"
export MANPATH="${HOME}/usr/man:${HOME}/usr/share/man:${MANPATH}"
export PKG_CONFIG_PATH="${HOME}/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"

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
