" Syntax highlighting interface
Plugin 'scrooloose/syntastic.git'
let g:locliststate=1
let g:syntastic_enable_ballons=0
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=0
let g:syntastic_enable_auto_jump=1
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['cpp', 'c'],
            \ 'passive_filetypes': ['python', 'javascript'] }

let g:syntastic_python_checkers=['flake8', 'pylint']
let g:syntastic_python_pylint_args = "--errors-only"

let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_debug = 0
let g:syntastic_typescript_tsc_fname = ''
let g:syntastic_typescript_checkers = ['tslint']

let g:syntastic_cpp_checkers=['gcc']

let g:syntastic_c_checkers=['gcc']


let g:syntastic_enable_highlighting=0
let g:syntastic_on=0
function! SyntasticToggle()
    let g:syntastic_enable_highlighting=g:syntastic_on
    SyntasticCheck
    if g:syntastic_on
        lclose
    end
    let g:syntastic_on=!g:syntastic_on
endfunction
nnoremap <silent> <leader>e :call SyntasticToggle()<CR>

