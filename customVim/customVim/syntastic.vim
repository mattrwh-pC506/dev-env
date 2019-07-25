" Syntax highlighting interface
Plugin 'scrooloose/syntastic.git'
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:locliststate=1
let g:syntastic_enable_ballons=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=3
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_auto_jump=3
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['cpp', 'c'],
            \ 'passive_filetypes': ['python', 'javascript', 'typescript.jsx', 'typescript.tsx', 'typescript', 'ts'] }

let g:syntastic_python_checkers=['flake8', 'pylint']
let g:syntastic_python_pylint_args = "--errors-only"

let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_debug = 0
let g:syntastic_typescript_tsc_fname = ''
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:syntastic_cpp_checkers=['gcc']

let g:syntastic_c_checkers=['gcc']


let g:syntastic_enable_highlighting=1
let g:syntastic_on=1
let g:matts_syntastic_error_menu_on_currently=0
function! SyntasticToggle()
    if g:matts_syntastic_error_menu_on_currently
        lclose
    end

    if !g:matts_syntastic_error_menu_on_currently
        lopen
    end
     
    let g:matts_syntastic_error_menu_on_currently=!g:matts_syntastic_error_menu_on_currently
endfunction
nnoremap <silent> <leader>e :call SyntasticToggle()<CR>
nnoremap <silent> <leader>f :lnext<CR>
nnoremap <silent> <leader>d :lprevious<CR>
