# Command line completions for common SNMP OIDs


if [ ${BASH_VERSINFO[0]} -ge 4 ]; then
	# $1 = command
	# $2 = current word (after token delimiters [=:])
	# $3 = previous word
	# ${COMP_WORDS[COMP_CWORD]} = complete current word
	_oid_complete() {
		local MIBDIR="${HOME}/.snmp/mibs"
		local cur="${COMP_WORDS[COMP_CWORD]}"

		#echo "---"
		#echo "1=$1"
		#echo "2=$2"
		#echo "3=$3"
		#echo "COMP_WORDS=${COMP_WORDS[*]}"
		#echo "COMP_CWORD=${COMP_CWORD}"
		#echo "---"
		if [ "$3" = "::" -o "${cur}" = "::" ]; then
			local MIBNAME MIBFILES F FILES OBJNAMES

			if [ "$3" = "::" ]; then
				MIBNAME="${COMP_WORDS[COMP_CWORD - 2]}"
			else
				MIBNAME="$3"
			fi

			FILES=$(cat "${MIBDIR}/.index" |grep "^${MIBNAME} " |cut -d' ' -f2)
			if [ "${FILES}" ]; then
				for F in ${FILES}; do
					MIBFILES="${MIBFILES} ${MIBDIR}/${F}"
				done
				OBJNAMES=$(cat ${MIBFILES} | awk '/^[ \t]*[a-zA-Z0-9-]+[ \t]+OBJECT-TYPE/ { print $1 }')
				COMPREPLY=($(compgen -W "${OBJNAMES}" "$2"))
			fi
		elif [ "${cur}" = ":" ]; then
			# Complete the "::" after the MIB name
			COMPREPLY=(":")
		else
			# Return a list of MIBs
			local MIBS=$(cat "${MIBDIR}/.index" | cut -d' ' -f1)
			COMPREPLY=($(compgen -S "::" -W "${MIBS}" "$2"))
		fi
	}
else
	# $1 = command
	# $2 = current word (after token delimiters [=:])
	# $3 = previous word
	# ${COMP_WORDS[COMP_CWORD]} = complete current word
	_oid_complete() {
		local cur="${COMP_WORDS[COMP_CWORD]}"
		local MIBDIR="${HOME}/.snmp/mibs"

		if [[ "${cur}" != *::* ]]; then
			# Return a list of MIBs
			local MIBS=$(cat "${MIBDIR}/.index" | cut -d' ' -f1)
			COMPREPLY=($(compgen -S "::" -W "${MIBS}" "${cur}"))
		else
			# Return a list of objects in the MIB
			local OBJNAMES MIBNAME MIBFILES F FILES

			MIBNAME=$(echo "${cur}" | sed -e 's/::.*//');
			FILES=$(cat "${MIBDIR}/.index" | grep "^${MIBNAME} " | cut -d' ' -f2)
			for F in ${FILES}; do
				MIBFILES="${MIBFILES} ${MIBDIR}/${F}"
			done
			OBJNAMES=$(cat ${MIBFILES} | awk '/^[ \t]*[a-zA-Z0-9-]+[ \t]+OBJECT-TYPE/ { print $1 }')
			COMPREPLY=($(compgen -W "${OBJNAMES}" "$2"))
		fi
	}
fi

complete -F _oid_complete -o nospace snmpget snmpgetnext snmpset snmpwalk snmptable
