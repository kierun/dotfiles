" Neovim configuration.
"
"   :checkhealth 

" Python
let g:python_host_prog="/home/yann/.pyenv/versions/neovim-2.7.5/bin/python"
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

" Folding
"   https://jdhao.github.io/2019/08/16/nvim_config_folding/
"   https://vim.fandom.com/wiki/Foldin
" -▼-
set foldmethod=marker
set foldmarker=-▼-,-▲-  " … Because who does not love silly UTF-8⸮
" -▲-

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plug: https://github.com/junegunn/vim-plug
" -▼-
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
" Run :PlugInstall to install plugins
" Run :PlugUpdate to update the plugins
"
call plug#begin('~/.vim/plugged')

" Vim airline: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'

" Vim airline theme: https://github.com/vim-airline/vim-airline-themes
Plug 'vim-airline/vim-airline-themes'

" Conquer of Completions: https://github.com/neoclide/coc.nvim
"   Do NOT use CoC-go, instead use vim-go see below.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" NERDTree: https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Vim easy align: https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Devicons.
Plug 'ryanoasis/vim-devicons'

" FZF: https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Vim syntax for TOML: https://github.com/cespare/vim-toml
Plug 'cespare/vim-toml'

" Fugitive: https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" Git gutter: https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" Opening a file in a given line: https://github.com/bogado/file-line
Plug 'bogado/file-line'

" Go support.
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Initialize plugin system
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -▲-

" Colours.
colorscheme neverness

" Syntax always on.
filetype plugin indent on
syntax on

" Set leader.
let mapleader=','

" Various commands.
set cursorcolumn
set cursorline
set laststatus=2
set mouse=a
set shiftwidth=4

" tab, because they are the devil's work!
" -▼-
set expandtab
autocmd FileType go set noexpandtab
set shiftwidth=4
set smarttab
set softtabstop=0 
set tabstop=4
" -▲-

"Configure airline.
" -▼-
let g:airline_detect_spell=1
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let airline#extensions#tabline#middle_click_preserves_windows = 1
" -▲-

" Configure Conquer of Completions.
" -▼-
let g:coc_global_extensions = ["coc-json",
      \ "coc-python",
      \ "coc-html",
      \ "coc-css",
      \ "coc-yaml",
      \ "coc-go",
      \ "coc-markdownlint",
      \ "coc-clangd",
      \ "coc-git"]

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" -▲-

" Configure easy align.
" -▼-
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Configure NERDTree.
let NERDTreeHijackNetrw = 0
let NERDChristmasTree = 1
nmap <F4> :NERDTreeToggle<CR>
" -▲-

" Configure vim-go
" -▼-
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" -▲-

" In English et en Français.
" -▼-
set spell
set spelllang=en_gb,fr

" FRENCH Mapping scheme in alphabetic order
" where _ denotes primary letter
"
"       à _â  ä
"         _ç
"       è _ê  ë  é
"         _î  ï
"         _ô  ö
"       ù _û  ü
"
" For capital letters, use the ~ or U operator.
" Note:  French usage does not require putting accents
" on capital letters, with the exception of Ç, unless
" you're typing all caps, e.g., Ecoutez ! vs. ÉCOUTEZ !
"
" Note:  map! for Insert and Command-line, i.e. imap & cmap
"
map! ;z à
map! ;a â
map! ;b ä
map! ;c ç
map! ;d è
map! ;e ê
map! ;f ë
map! ;g é
map! ;i î
map! ;j ï
map! ;o ô
map! ;p ö
imap ;q «  »<Esc>hi
"         ^inserts within Quotations
map! ;t ù
map! ;u û
map! ;v ü
map! ;; ⸮
" -▲-

" Because I love some UTF-8!
" -▼-
map! ;1 ☺
map! ;2 ⍨
map! ;3 ☹
map! ;4 ⚠
map! ;5 ♬
map! ;6 ☣
map! ;7 ☠
" -▲-

" Copy and paste.
" -▼-
vmap <LeftRelease> "*ygv

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" -▲-

" Format.
" -▼-
nnoremap <leader>g gqip
vnoremap <leader>g gqip
" -▲-

" Fixed width!
autocmd FileType text,mail,tex,xhtml,html,markdown,c,cpp,python,rst,gitcommit set textwidth=78

" No spelling on YAML files… I mean, really?
autocmd FileType yaml set nospell

" Auto save: http://vim.wikia.com/wiki/Auto_save_files_when_focus_is_lost
au FocusLost * :wa
set autowriteall
