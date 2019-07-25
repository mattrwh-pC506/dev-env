" better html/javascript syntax/indenting
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"


au BufWinEnter,InsertEnter,BufRead,InsertEnter,BufLeave,BufWinLeave *.html setlocal filetype=html
