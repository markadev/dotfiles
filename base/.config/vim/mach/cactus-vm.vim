
" Create a mapping to call 'make' through brunner when ^B is pressed
if executable("./waf")
	map  :silent !brunner ./waf<CR>
elseif filereadable("Makefile")
	map  :silent !brunner make<CR>
endif
