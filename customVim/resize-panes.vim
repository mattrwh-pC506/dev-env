fun! VexSize(vex_width)
    execute "vertical resize" . a:vex_width
    set winfixwidth
    call NormalizeWidths()
endf

fun! NormalizeWidths()
    let eadir_pref = &eadirection
    set eadirection=hor
    set equalalways! equalalways!
    let &eadirection = eadir_pref
endf

augroup NetrwGroup
    autocmd! BufEnter * call NormalizeWidths()
augroup END

" Resize Panes on window resize
:autocmd VimResized * wincmd =
