" :help syn-define

"syn match redundantSpaces /\s\+$/
"syn match redundantSpaces / \+\ze\t/
"highlight redundantSpaces ctermbg=Red guibg=Red

"syn region cFold start="{" end="}" transparent fold
"syn sync fromstart
"set foldmethod=syntax
"set foldlevel=99

set formatoptions-=ro
set nocindent
let c_minlines=400
