" Determine the root of the ClearCase view (if any)
if executable("cleartool")
	let ccviewroot = system("cleartool pwv -root")
	if v:shell_error == 0
		if has("win32unix") && executable("cygpath")
			" translate paths from windows to cygwin
			let ccviewroot = system("cygpath -au '".ccviewroot."'")
		endif

		" Remove garbage control characters at the end
		let ccviewroot = matchstr(ccviewroot, "\\p*")

		" Set tag files
		set tags=./tags,./../tags
		let &tags = &tags . ",".ccviewroot."/SW/nonbranched/tags"
		let &tags = &tags . ",".ccviewroot."/SW/ne/apps/apis/tags"
		let &tags = &tags . ",".ccviewroot."/SW/ne/apps/utilities/tags"
		let &tags = &tags . ",".ccviewroot."/SW/ne/apps/infrastructure/tags"

		" Check out the opened file from ClearCase
		map  :!cleartool checkout -nc -unreserved %<CR>:set noro<CR>
		set autoread

		" Expand tabs to spaces
		set expandtab

		" Build with a belownormal priority omake
		let &makeprg="cmd /c start /b /wait /belownormal omake"

		" put activeperl at the head of the PATH
		if has("win32") || has("win64")
			let $PATH="C:\Perl\bin;".$PATH
		elseif has("win32unix")
			let $PATH="/cygdrive/c/Perl/bin:".$PATH
		endif

		" Format strings for the Green Hills C/C++ compiler
		" To debug this stuff, use the 'cfile' command
		" TODO: catch link errors
		set efm=%E\"%f\"\\,\ line\ %l:\ err%.%#    " match error messages
		set efm+=%W\"%f\"\\,\ line\ %l:\ warn%.%#  " match warning messages
		set efm+=%-Z                  " empty line ends the message
		set efm+=%-C\ \ %p^           " Match the column #
		" FIXME: only the first line is the error message
		set efm+=%+C%m                " Match the error message
		set efm+=%-G%.%#              " Throw away everything else

"Compile (CC)  C:\maikens_61view\SW\ne\apps\cktm\cktmmsghdlrenet.cpp  to  cktmmsghdlrenet.o
""C:\maikens_61view\SW\ne\apps\cktm\cktmmsghdlrenet.cpp", line 83: error:
"          identifier "aa" is undefined
"          traceCktLog = true;aa
"                             ^
" --- Creating : ..\.\objm1_dbg\cktm.elf ---
"
" -LC:\maikens_61view\SW\ne\apps\lib\g4_dbg -LC:\maikens_61view\SW\ne\apps\lib\g4 -LC:\maikens_61view\SW\ne\libraries\diags\lib -LC:\maikens_61view\SW\ne\libraries\drivers\lib -LC:\maikens_61view\SW\ne\kernel\ose/bsp/common/lib -LC:\maikens_61view\SW\ne\kernel\ose/bsp/common/krn-7400/lib -LC:\maikens_61view\SW\ne\libraries\diags\lib
"C:\maikens_61view\Tools\ppc36\cxppc.exe --stdl @..\.\objm1_dbg\cktm.rsp
"[elxr] (error) unresolved symbols: 3
" CktmBmuxCktCls::OkToProgram(bool, CktmStatusE *)       from cktmbmuxcktcls.o
" CktmBmuxCktCls::ProgHw(CktmProgCktHwModeE, bool, bool)         from cktmbmuxcktcls.o
" CktmBmuxCktCls::DeprogHw(bool)         from cktmbmuxcktcls.o
"
"[elxr] (error) errors during processing

	endif
endif
