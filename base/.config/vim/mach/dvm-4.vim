map  :silent !brunner svtmake<CR>

set expandtab

for tf in [ 'tags','../tags','../../tags','../../../tags','../../../../tags','../../../../../tags', '../../../../../../tags' ]
    if filereadable(tf)
        let &tags=tf
        break
    endif
endfor
