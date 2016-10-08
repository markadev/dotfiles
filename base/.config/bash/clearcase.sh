# Command line completion and aliases for ClearCase


# Aliases
alias ccopened='cleartool lscheckout -recurse -me -cview -fmt "%u %n (%Rf)\n"'
alias cccheckout="cleartool checkout -nc -unreserved"
alias ccrevert="cleartool uncheckout -keep"
alias ccupdate="cleartool update"


# Helper to retrieve the predecessor of a file
__cc_get_predecessor() {
	test $# -eq 2 || return 1

	# Get the pname of the predecessor, changing the "slashes" to real slashes
	#local PREDECESSOR=$(cleartool describe -pred -short $1 | sed -e 's:\\:/:g')
	local PREDECESSOR=$(cleartool describe -pred -short $1)
	test "${PREDECESSOR}" || return 1
	PNAME="$1@@${PREDECESSOR}"

	local TMPFILE
	if [ "${TERM}" = "cygwin" ]; then
		# Translate the path so cleartool can use it
		TMPFILE=$(cygpath -aw "$2")
	else
		TMPFILE="$2"
	fi
	#echo "PNAME=${PNAME}"
	#echo "TMPFILE=${TMPFILE}"

	# Pull out a copy of the predecessor
	cleartool get -to "${TMPFILE}" "${PNAME}"
	return $?
}

ccvimdiff() {
	if [ $# -ne 1 ]; then
		echo "Usage: ccvimdiff <filename>"
		return 1
	fi

	# Generate the name of the temp file we'll use for the predecessor
	local TMPFILE="/tmp/previous-$(basename $1)"

	__cc_get_predecessor "$1" "${TMPFILE}"
	test $? -eq 0 || return 1

	vimdiff "${TMPFILE}" "$1"

	rm -f "${TMPFILE}"
}

ccdiff() {
	if [ $# -ne 1 ]; then
		echo "Usage: ccdiff <filename>"
		return 1
	fi

	# Generate the name of the temp file we'll use for the predecessor
	local TMPFILE="/tmp/$(id -un)-previous-$(basename $1)"

	__cc_get_predecessor "$1" "${TMPFILE}"
	test $? -eq 0 || return 1

	diff -u "${TMPFILE}" "$1"

	rm -f "${TMPFILE}"
}

cchelp() {
	cat <<EOF

Useful clearcase commands:
  List files that need to be merged, run this from a view of the
    merge destination branch:
      cleartool findmerge . -fver .../bmux-dev1/LATEST -print
    "bmux-dev1" is the source branch
    "." is the directory to search

EOF
}
