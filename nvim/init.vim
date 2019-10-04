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
"
" When pylint and co stop working, it's Python Language Server's not being set
" up properly. Too often have I looked for this shit.
"
" Run:
"   pip install python-language-server
"   pip install 'python-language-server[all]'
call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
\ } )
    let g:LanguageClient_loggingLevel = 'INFO'
    let g:LanguageClient_loggingFile =  expand('~/log/LanguageClient.log')
    let g:LanguageClient_serverStderr = expand('~/log/LanguageServer.log')
    let g:LanguageClient_autoStart = 1
    let g:LanguageClient_serverCommands = {
        \ 'python': ['pyls', '-v'],
        \ 'cpp': ['clangd'],
        \ }
    nnoremap <silent> H :call LanguageClient_textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
    let g:LanguageClient_useFloatingHover = 1

" Coc is an intellisense engine for vim8 & neovim.
" https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})

" " NCM2, formerly known as nvim-completion-manager, is a slim, fast hackable
" " completion framework, for neovim.
" " https://github.com/ncm2/ncm2
" call dein#add('ncm2/ncm2')
" " ncm2 requires nvim-yarp
" call dein#add('roxma/nvim-yarp')
"     " enable ncm2 for all buffer
"     autocmd BufEnter * call ncm2#enable_for_buffer()
" 
"     " note that must keep noinsert in completeopt, the others is optional
"     set completeopt=noinsert,menuone,noselect
"     
"     " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
"     inoremap <c-c> <ESC>
" 
"     " When the <Enter> key is pressed while the popup menu is visible, it only
"     " hides the menu. Use this mapping to close the menu and also start a new
"     " line.
"     inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
" 
"     " Use <TAB> to select the popup menu:
"     inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"     inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" 
" " Some completion sources…
" call dein#add('ncm2/ncm2-bufword')
" call dein#add('ncm2/ncm2-tmux')
" call dein#add('ncm2/ncm2-path')
" call dein#add('ncm2/ncm2-jedi')
" 
" " NCM2, Clang, and C++ … 'cause it's SPECIAL!
" call dein#add('ncm2/ncm2-pyclang')
" 
"     " Path to directory where libclang.so can be found ← Make sure you create it
"     " and sym link it if the lib is somewhere else on your system. Yeah, Fedora
"     " and CentOS put it in different places because fuck you, that's why.
"     let g:ncm2_pyclang#library_path = '/home/yann/llvm/lib'
"     " a list of relative paths for compile_commands.json
"     let g:ncm2_pyclang#database_path = [
"                 \ 'compile_commands.json',
"                 \ 'build/compile_commands.json'
"                 \ ]
"     " Goto Declaration
"     autocmd FileType c,cpp nnoremap <buffer> gd :<c-u>call ncm2_pyclang#goto_declaration()<cr>

" Vim airline.
call dein#add('vim-airline/vim-airline-themes')
call dein#add('bling/vim-airline.git')
  let g:airline_powerline_fonts = 1
  let g:airline_theme='molokai'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#tabline#show_buffers = 1
  let airline#extensions#tabline#middle_click_preserves_windows = 1

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
  nmap <F3> :GundoToggle<CR>

" Vim flake 8.
"call dein#add("nvie/vim-flake8")

" Fugitive
call dein#add("tpope/vim-fugitive")

" Tagbar for navigation by tags using CTags
call dein#add("majutsushi/tagbar.git")
  let g:tagbar_autofocus = 1
  nnoremap <leader>rt :!ctags --extra=+f -R *<CR><CR>
  nnoremap <leader>. :TagbarToggle<CR>

" C++/Clang/LLVM/LLDB
"call dein#add("critiqjo/lldb.nvim")

" " Neo make.
" call dein#add("benekastah/neomake")
"   autocmd! BufWritePost * Neomake
" "  let g:neomake_cpp_enable_markers=['clang']
" "  let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
"   let g:neomake_python_enabled_makers = ['pep8', 'flake8', 'pylama', 'python']
"   let g:neomake_airline = 1

" Python folding.
call dein#add("tmhedberg/SimpylFold")
  let g:SimpylFold_docstring_preview = 1
  let g:SimpylFold_fold_import = 0
  nnoremap <space> za

" CSS colours.
"call dein#add("ap/vim-css-color")

" https://github.com/RRethy/vim-hexokinase
call dein#add('rrethy/vim-hexokinase', { 'build': 'make hexokinase' })
let g:Hexokinase_highlighters = [ 'virtual' ]
let g:Hexokinase_optInPatterns = ['full_hex', 'triple_hex', 'rgb', 'rgba', 'colour_names']

" Git gutter.
call dein#add("airblade/vim-gitgutter")

" vim fetch.
call dein#add("kopischke/vim-fetch")

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

" FZF: https://github.com/junegunn/fzf.vim
call dein#add("junegunn/fzf.vim")

" Plugin for vim to enable opening a file in a given line 
" https://github.com/bogado/file-line
call dein#add('bogado/file-line')

" C++ highlighting: https://github.com/octol/vim-cpp-enhanced-highlight
call dein#add('octol/vim-cpp-enhanced-highlight')
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1


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
autocmd FileType text,mail,tex,xhtml,html,markdown,c,cpp,python,rst,gitcommit set textwidth=78

" No spelling on YAML files… I mean, really?
autocmd FileType yaml set nospell

" Neovim-qt Guifont command
command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"

" Auto save.
" http://vim.wikia.com/wiki/Auto_save_files_when_focus_is_lost
au FocusLost * :wa
set autowriteall

" Grovey & Jenkinsfile…
au BufNewFile,BufRead Jenkinsfile setf groovy    
