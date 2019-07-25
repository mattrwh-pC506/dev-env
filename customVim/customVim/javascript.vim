" Better javascript indenting etc.
Plugin 'pangloss/vim-javascript.git'

au BufWinEnter,InsertEnter,BufRead,InsertEnter,BufLeave,BufWinLeave *.js setlocal filetype=javascript
