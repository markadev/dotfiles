# Include local system bash functionality

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
elif [ -f /etc/bash/bashrc ]; then
	. /etc/bash/bashrc
fi
