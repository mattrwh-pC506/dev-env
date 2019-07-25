" Typescript script support.
Plugin 'leafgarland/typescript-vim.git'
Plugin 'Quramy/tsuquyomi'
Plugin 'peitalin/vim-jsx-typescript'

let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
" set ballooneval
au FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
au FileType typescript setlocal completeopt+=menu,preview
au FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
" au InsertLeave,TextChanged,BufWritePost *.ts,*.tsx call tsuquyomi#asyncGeterr(1000)
au BufWinEnter,BufEnter,BufRead,InsertEnter,BufLeave,BufWinLeave *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

 "TSFMT
"if !exists("s:vist")
    "let s:vist = {'depth': 0}
"endif
"func! SaveView()
    "if s:vist.depth == 0
        "let s:vist.view = winsaveview()
    "endif
    "let s:vist.depth += 1
"endfunc
"func! RestoreView()
    "if s:vist.depth == 1
        "call winrestview(s:vist.view)
        "unlet s:vist.view
    "endif
    "let s:vist.depth -= 1
"endfunc
"com! -nargs=* -complete=command KeepView
    "\ try| call SaveView()| exec <q-args>
    "\| finally| call RestoreView()| endtry
"autocmd BufWritePre *.ts KeepView %! tsfmt --stdin
