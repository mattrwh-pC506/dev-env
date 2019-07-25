" visual selection search with # and *
Plugin 'nelstrom/vim-visual-star-search'

" Ack search integration
Plugin 'mileszs/ack.vim.git'
let g:ackprg = 'ack --noheading --nocolor --nogroup --column --smart-case --follow --nobreak'

" A fuzzy file finder-- really great just press CTRL-P!
Plugin 'ctrlpvim/ctrlp.vim.git'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/node_modules
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['dir']
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
            \ 'file': '\v\.(pyc)$',
            \ 'dir': '\v[\/](env|collected_static|node_modules|.git)$',
            \ }
