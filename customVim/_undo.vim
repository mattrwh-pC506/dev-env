" branching undo is new in vim 7.3
if v:version > 702
    let &undodir=g:DV."/tmp/undo"
    if !isdirectory(g:DV."/tmp/undo")
        call mkdir(g:DV."/tmp/undo", 'p', 0755)
    endif
    set undofile

    " Graphical interface for the vim's branching undo stuff
    Plugin 'sjl/gundo.vim.git'
    nnoremap <silent> <leader>4 :GundoToggle<CR>
    let g:gundo_right = 1
    let g:gundo_help  = 0
endif
