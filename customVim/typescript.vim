" Typescript script support.
Plugin 'leafgarland/typescript-vim.git'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'

au BufWinEnter,BufEnter,BufRead,InsertEnter,BufLeave,BufWinLeave *.ts setlocal filetype=typescript

" TSFMT
if !exists("s:vist")
    let s:vist = {'depth': 0}
endif
func! SaveView()
    if s:vist.depth == 0
        let s:vist.view = winsaveview()
    endif
    let s:vist.depth += 1
endfunc
func! RestoreView()
    if s:vist.depth == 1
        call winrestview(s:vist.view)
        unlet s:vist.view
    endif
    let s:vist.depth -= 1
endfunc
com! -nargs=* -complete=command KeepView
    \ try| call SaveView()| exec <q-args>
    \| finally| call RestoreView()| endtry
autocmd BufWritePre *.ts KeepView %! tsfmt --stdin
