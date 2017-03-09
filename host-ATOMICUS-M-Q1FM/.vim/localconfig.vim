set expandtab

for tf in [ 'tags','../tags','../../tags','../../../tags','../../../../tags','../../../../../tags', '../../../../../../tags' ]
    if filereadable(tf)
        let &tags=tf
        break
    endif
endfor

" Set terraform syntax used here. Allow '-' in words for much easier symbol searching
autocmd Filetype terraform setlocal iskeyword+=- ts=2 sw=2 expandtab
