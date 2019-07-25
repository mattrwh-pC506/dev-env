" Hard Mode to help user learn advanced vim techniques
Plugin 'wikitopian/hardmode.git'
au BufWinEnter,BufEnter,BufRead,InsertEnter,BufLeave,BufWinLeave * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
