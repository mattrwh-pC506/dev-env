" Nice buffer browsers/switcher
Plugin 'corntrace/bufexplorer'
noremap <silent> <leader>3 :BufExplorer<CR>
let g:bufExplorerDefaultHelp=0

" Close buffers (:BufOnly)
Plugin 'vim-scripts/BufOnly.vim'

" buffer switching
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> <leader>b :b#<CR>
