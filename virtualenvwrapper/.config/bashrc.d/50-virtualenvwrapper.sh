if [ -f "${HOME}/.local/bin/virtualenvwrapper.sh" ]; then
	. "${HOME}/.local/bin/virtualenvwrapper.sh"
elif [ -f "/usr/share/virtualenvwrapper/virtualenvwrapper.sh" ]; then
	. /usr/share/virtualenvwrapper/virtualenvwrapper.sh
else
	. virtualenvwrapper.sh
fi
