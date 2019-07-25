" Set everything so vundle can load
autocmd!
filetype off
let &rtp.=','.g:DV.'/bundle/Vundle.vim'
call vundle#begin(g:DV.'/bundle')
Plugin 'gmarik/Vundle.vim'
