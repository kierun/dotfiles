" Neovim configuration.

" Python
let g:python3_host_prog="/home/yann/.virtualenvs/neovim/bin/python"
let g:python_host_prog="/home/yann/.virtualenvs/neovim2/bin/python"

" BEGIN dark powered Vim/Neovim plugin manager. ----------------------------
" Run this command to update your plugins:
"        :call dein#update()

if &compatible
   set nocompatible
endif

set runtimepath^=/home/yann/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))
call dein#add('/home/yann/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim')

" Installs a log file!
let g:dein#install_log_filename=expand("~/.cache/dein/dein.log")

" LSP: 
" https://github.com/autozimu/LanguageClient-neovim
" https://github.com/palantir/python-language-server
call dein#add('autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
\ } )

    let g:LanguageClient_autoStart = 1
    let g:LanguageClient_serverCommands = {
        \ 'python': ['pyls', '-v'] }
    nnoremap <silent> H :call LanguageClient_textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> Z :call LanguageClient_textDocument_definition()<CR>

" Vim airline.
call dein#add('vim-airline/vim-airline-themes')
call dein#add('bling/vim-airline.git')
  let g:airline_powerline_fonts = 1
  let g:airline_theme='molokai'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let airline#extensions#tabline#middle_click_preserves_windows = 1

" Supertab.
call dein#add("ervandew/supertab.git")
  let g:SuperTabContextDefaultCompletionType = "<c-n>"

" NERDTree for project drawer
call dein#add("scrooloose/nerdtree.git")
  let NERDTreeHijackNetrw = 0
  let NERDChristmasTree = 1
  nmap <F4> :NERDTreeToggle<CR>

" NERD tree + tabs.
call dein#add("jistr/vim-nerdtree-tabs.git")
  let g:nerdtree_tabs_open_on_gui_startup=2
  let g:nerdtree_tabs_open_on_console_startup=2

" NERD tree + git
call dein#add("Xuyuanp/nerdtree-git-plugin")

" gundo for awesome undo tree visualization
call dein#add("sjl/gundo.vim.git")
  nnoremap <leader>h :GundoToggle<CR>

" Vim flake 8.
"call dein#add("nvie/vim-flake8")

" Fugitive
call dein#add("tpope/vim-fugitive")

" Tagbar for navigation by tags using CTags
call dein#add("majutsushi/tagbar.git")
  let g:tagbar_autofocus = 1
  nnoremap <leader>rt :!ctags --extra=+f -R *<CR><CR>
  nnoremap <leader>. :TagbarToggle<CR>

" Jedi… https://github.com/davidhalter/jedi
"call dein#add("davidhalter/jedi")

" Jedi-vim
"call dein#add("davidhalter/jedi-vim")
"  let g:jedi#show_call_signatures = "0"

" Deoplete is the abbreviation of 'dark powered neo-completion'!
call dein#add("Shougo/deoplete.nvim", { 'do': ':UpdateRemotePlugins' } )
    let g:deoplete#enable_at_startup = 1
    source $HOME/.config/nvim/deoplete.vim
"call dein#add("zchee/deoplete-jedi")

"call dein#add('tweekmonster/deoplete-clang2')
"  let g:deoplete#sources#clang#libclang_path="/usr/lib64/llvm/libclang.so"
"  let g:deoplete#sources#clang_header="/usr/include/clang"

" C++/Clang/LLVM/LLDB
"call dein#add("critiqjo/lldb.nvim")

" Neo make.
call dein#add("benekastah/neomake")
  autocmd! BufWritePost * Neomake
"  let g:neomake_cpp_enable_markers=['clang']
"  let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
  let g:neomake_python_enabled_makers = ['pep8', 'flake8', 'pylama', 'python']
  let g:neomake_airline = 1

" Python folding.
call dein#add("tmhedberg/SimpylFold")
  let g:SimpylFold_docstring_preview = 1
  let g:SimpylFold_fold_import = 0
  nnoremap <space> za

" CSS colours.
call dein#add("ap/vim-css-color")

" Git gutter.
call dein#add("airblade/vim-gitgutter")

" vim fetch.
call dein#add("kopischke/vim-fetch")

" tabular.
"call dein#add("godlygeek/tabular")

" Vim easy align: https://github.com/junegunn/vim-easy-align
call dein#add("junegunn/vim-easy-align")
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)

" Altr: swtich between header and source files…#
call dein#add("kana/vim-altr")
nmap <F2> <Plug>(altr-forward)
nmap <F3> <Plug>(altr-back)
command! A call altr#forward()

" CTRL+P Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
call dein#add("ctrlpvim/ctrlp.vim")
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'

" Devicons.
call dein#add("ryanoasis/vim-devicons")

" Vim buffer kill…
call dein#add("qpkorr/vim-bufkill")

" Dark powered asynchronous unite all interfaces for Neovim/Vim8
"call dein#add("Shougo/denite.nvim")

" Python mode: https://github.com/python-mode/python-mode
" call dein#add("python-mode/python-mode")
"     nnoremap <space> za
"     let g:pymode = 1
"     let g:pymode_python = 'python3'
"     let g:pymode_lint_checkers = ['flake8', 'pep8', 'mccabe']
"     " let g:pymode_lint_checkers = ['flake8', 'pep8', 'mccabe', 'pep257']
"     let g:pymode_rope = 1
"     let g:pymode_rope_completion = 1
"     let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'sys']
"     let g:pymode_rope_autoimport_import_after_complete = 1
"     autocmd FileType python setlocal omnifunc=RopeCompleteFunc

" FZF: https://github.com/junegunn/fzf.vim
call dein#add("junegunn/fzf.vim")

" All done.
call dein#end()

filetype plugin indent on
" END dark powered Vim/Neovim plugin manager. ------------------------------

" True colours: Does not seem to be working…
"set termguicolors

" Status line...
set laststatus=2

" In English and en Français.
set spell
set spelllang=en_gb,fr
"set spelllang=fr

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

" Color scheme.
" set background=dark
colorscheme neverness
filetype plugin indent on
syntax on

" Various commands.
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set cursorcolumn
let mapleader=','
set mouse=a

" Copy and paste.
"set clipboard+=unmappedplus
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

" Format.
nnoremap <leader>g gqip
vnoremap <leader>g gqip

" Fixed width!
autocmd FileType text,mail,tex,xhtml,html,markdown,c,cpp,python,bzrlog,rst,gitcommit set textwidth=78

" No spelling on YAML files… I mean, really?
autocmd FileType yaml set nospell

" Neovim-qt Guifont command
command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"

" Set the font.
Guifont Terminess Powerline:h8

" Auto save.
" http://vim.wikia.com/wiki/Auto_save_files_when_focus_is_lost
au FocusLost * :wa
set autowriteall

" Grovey & Jenkinsfile…
au BufNewFile,BufRead Jenkinsfile setf groovy    

" EOF
