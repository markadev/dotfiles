MARK_STORAGE_DIR="${CONFIG}/marks"

_marks_find="find"
if [ $(uname) = "Darwin" ]; then
	_marks_find="gfind"
fi

# Bookmark a directory
mark() {
	if [ $# -lt 1 ]; then
		echo "Usage: mark <markname>"
		echo "Makes a bookmark for the current directory"
		echo "See also: unmark, marks, mcd, mpushd"
		echo ""
		return 1
	fi
	test ! -d "${MARK_STORAGE_DIR}" && mkdir -p "${MARK_STORAGE_DIR}"
	local MARKDIR=$(pwd)
	if [ -e "${MARK_STORAGE_DIR}/$1" ]; then
		echo "Error: A mark named '$1' already exists"
		return 1
	fi
	ln -s "${MARKDIR}" "${MARK_STORAGE_DIR}/$1"
}

# Unbookmark a directory
unmark() {
	if [ $# -lt 1 ]; then
		echo "Usage: unmark <markname>"
		echo "Removes a directory bookmark"
		echo "See also: mark, marks, mcd, mpushd"
		echo ""
		return 1
	fi
	test -L "${MARK_STORAGE_DIR}/$1" && rm -f "${MARK_STORAGE_DIR}/$1"
}

# List bookmarked directories
marks() {
	if [ -d "${MARK_STORAGE_DIR}" ]; then
		${_marks_find} "${MARK_STORAGE_DIR}" -type l -printf "%f -> %l\n"
	fi
}

# Change to a bookmarked directory
mcd() {
	if [ $# -lt 1 ]; then
		echo "Usage: mcd <markname>"
		echo "Changes to a bookmarked directory"
		echo "See also: mark, unmark, marks, mpushd"
		echo ""
		return 1
	fi

	local P=$(readlink "${MARK_STORAGE_DIR}/$1" 2>/dev/null)
	if [ -z "${P}" ]; then
		echo "Error: No mark named '$1'"
		return 1
	fi
	cd "${P}"
}

# Change to a bookmarked directory using pushd
mpushd() {
	if [ $# -lt 1 ]; then
		echo "Usage: mpushd <markname>"
		echo "Changes to a bookmarked directory and pushes the old directory onto the"
		echo "directory stack."
		echo "See also: mark, unmark, marks, mcd"
		echo ""
		return 1
	fi

	local P=$(readlink "${MARK_STORAGE_DIR}/$1" 2>/dev/null)
	if [ -z "${P}" ]; then
		echo "Error: No mark named '$1'"
		return 1
	fi
	pushd "${P}"
}

# Name completion for mark names
_markname_complete() {
	if [ ${COMP_CWORD} -lt 2 ]; then
		COMPREPLY=($(${_marks_find} "${MARK_STORAGE_DIR}" -type l -name "$2*" -printf "%f\n" 2>/dev/null))
	fi
}
complete -F _markname_complete mcd mpushd unmark
