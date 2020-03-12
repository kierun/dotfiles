set nocompatible
set runtimepath^=/path/to/coc.nvim
filetype plugin indent on
syntax on
set hidden
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
let g:coc_global_extensions = ["coc-json",
    \ "coc-python",
    \ "coc-go"]
