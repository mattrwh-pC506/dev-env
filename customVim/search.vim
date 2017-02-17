" visual selection search with # and *
Plugin 'nelstrom/vim-visual-star-search'

" Ack search integration
Plugin 'mileszs/ack.vim.git'
let g:ackprg = 'ack --noheading --nocolor --nogroup --column --smart-case --follow --nobreak'

" A fuzzy file finder-- really great just press CTRL-P!
Plugin 'kien/ctrlp.vim.git'
let g:ctrlp_working_path_mode = 'ar'
let g:ctrlp_extensions = ['dir']
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
            \ 'file': '\v\.(pyc)$',
            \ 'dir': '\v[\/](env|collected_static)$',
            \ }
