" Highlight whitespace with <leader>w, and remove with <leader>W
nnoremap <leader>w :/\s\+$<CR>
nnoremap <leader>W :%s/\s\+$//e<CR><silent>:noh<CR>
