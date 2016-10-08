# Command line completions for binutils programs


# Add matching long options to the list of possible completions
# Arguments:
#   LONGOPTS - A string containing all the possible long options, without the
#              preceeding "--". If an option ends with '=', no space will be
#              appended to allow for typing the argument.
#   $1 - The word that is currently being completed
_complete_longopts() {
	local opt word="$1"

	case "${word}" in
	--*=*)
		COMPREPLY=("")
		return
		;;
	--*)
		;;
	*)
		return
		;;
	esac

	for opt in ${LONGOPTS}; do
		if [[ "--${opt}" == ${word}*= ]]; then
			COMPREPLY=("${COMPREPLY[@]}" "--${opt}")
		elif [[ "--${opt}" == ${word}* ]]; then
			COMPREPLY=("${COMPREPLY[@]}" "--${opt} ")
		fi
	done
}


# $1 = command
# $2 = current word (after any '=')
# $3 = previous word
# COMP_WORDS[COMP_CWORD] = complete current word

_objdump_complete() {
	local LONGOPTS="archive-headers target= demangle disassemble disassemble-all disassemble-zeroes endian= file-headers file-start-context debugging section-headers headers info section= line-numbers source architecture= disassembler-options= private-headers reloc dynamic-reloc full-contents stabs syms dynamic-syms all-headers wide start-address= stop-address= prefix-addresses no-show-raw-insn show-raw-insn adjust-vma= help"
	local cur="${COMP_WORDS[COMP_CWORD]}"

	case "${cur}" in
	--endian=*)
		COMPREPLY=($(compgen -W "big little" -- "$2"))
		COMPREPLY=("${COMPREPLY[@]/%/ }")
		return
		;;
	--demangle=*)
		COMPREPLY=($(compgen -W "none auto gnu lucid arm hp edg gnu-v3 java gnat compaq" -- "$2"))
		COMPREPLY=("${COMPREPLY[@]/%/ }")
		return
		;;
	esac

	_complete_longopts "${cur}"
}

_objcopy_complete() {
	local LONGOPTS="target= input-target= output-target= binary-architecture= strip-all strip-debug keep-symbol= strip-symbol= keep-global-symbol= localize-symbol= weaken-symbol= discard-all discard-locals byte= interleave= only-section= remove-section= preserve-dates debugging gap-fill= pad-to= set-start= adjust-start= change-addresses= change-section-address change-section-lma change-section-vma change-warnings no-change-warnings set-section-flags add-section rename-section change-leading-char remove-leading-char srec-len= srec-forceS3 redefine-sym redefine-syms= weaken keep-symbols= strip-symbols= keep-global-symbols= localize-symbols= weaken-symbols= alt-machine-code= prefix-symbols= prefix-sections= prefix-alloc-sections= add-gnu-debuglink= only-keep-debug verbose version info help"
	local cur="${COMP_WORDS[COMP_CWORD]}"

	case "${cur}" in
	--keep-symbols=*|--strip-symbols=*|--keep-global-symbols=*|--localize-symbols=*|--weaken-symbols=*|--add-gnu-debuglink=*)
		return
		;;
	esac

	_complete_longopts "${cur}"
}

complete -F _objdump_complete -o default -o nospace objdump
complete -F _objcopy_complete -o default -o nospace objcopy
