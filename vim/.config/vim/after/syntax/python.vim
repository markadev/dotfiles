" Newlines between folded sections are included in the folded sections
"syn region pythonFold start=":\(\n^\)\+\z(\s*\)" skip="^\n" end="^\z1\@!" fold transparent

" Folded sections don't include newlines between sections.
syn region pythonFold start=":\(\n^\)\+\z(\s*\)" end="^\(\(^\n\)*\z1\)\@!" fold transparent

syn match pythonError "^ *	\+"
syn match pythonError ";\s*$"
highlight pythonError ctermbg=Red guibg=Red

syn match redundantSpaces /\s\+$/
highlight redundantSpaces ctermbg=Red guibg=Red

syn sync fromstart
set foldmethod=syntax
set foldlevel=99

" Never use tab characters
set expandtab
