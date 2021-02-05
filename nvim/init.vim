" Neovim configuration
"
"   :checkhealth

" Folding
"   https://jdhao.github.io/2019/08/16/nvim_config_folding/
"   https://vim.fandom.com/wiki/Foldin
" -▼-
set foldmethod=marker
set foldmarker=-▼-,-▲-  " … Because who does not love silly UTF-8⸮
" -▲-

"---- vim-plug setup  ----
" -▼-
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
" -▲-

set nocompatible

" Set leader.
let mapleader=','


" Vim plug: https://github.com/junegunn/vim-plug
" -▼-
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"
" Run :PlugInstall to install plugins
" Run :PlugUpdate to update the plugins
"
call plug#begin('~/.config/nvim/plugged')

" Sensible default 
Plug 'tpope/vim-sensible'

" Vim airline: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'

" Vim airline theme: https://github.com/vim-airline/vim-airline-themes
Plug 'vim-airline/vim-airline-themes'

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

" Go debugger: delve.
Plug 'sebdah/vim-delve'

" vimwiki: https://github.com/vimwiki/vimwiki
Plug 'vimwiki/vimwiki'

" Nord theme: https://github.com/arcticicestudio/nord-vim
Plug 'arcticicestudio/nord-vim'

" Python folding: https://github.com/tmhedberg/SimpylFold
Plug 'tmhedberg/SimpylFold'

" LaTeX: https://github.com/lervag/vimtex
Plug 'lervag/vimtex'

" Flutter / Dart: https://github.com/dart-lang/dart-vim-plugin
Plug 'dart-lang/dart-vim-plugin'

" Asciidoctor
Plug 'habamax/vim-asciidoctor'

" https://github.com/hashivim/vim-terraform
Plug 'hashivim/vim-terraform'

" Native LSP.
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

call plug#end()
" -▲-

" Automatically install missing plugins on startup
" -▼-
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

if has('termguicolors')
  set termguicolors
endif
" -▲-

" Configure Nord theme.
" -▼-
let g:nord_cursor_line_number_background = 1
let g:nord_italic_comments = 1

" This makes airline load.
colorscheme nord
" -▲-

"Configure airline.
" -▼-
let g:airline_detect_spell=1
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let airline#extensions#tabline#middle_click_preserves_windows = 1
" -▲-

" Configure easy align.
" -▼-
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" -▲-

" Configure NERDTree.
" -▼-
let NERDTreeHijackNetrw = 0
let NERDChristmasTree = 1
nmap <F4> :NERDTreeToggle<CR>
" -▲-

" Configure vimwiki.
" -▼-
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/src/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" -▲-

" Configure SimpylFold
" -▼-
let g:SimpylFold_docstring_preview = 1
" -▲-

" Configure LaTeX
" -▼-
autocmd FileType tex setlocal ts=2 sts=2 sw=2 expandtab
let g:tex_flavor = 'latex'
" -▲-

" Configure asciidoctor
" -▼-
" Fold sections, default `0`.
let g:asciidoctor_folding = 1

" Fold options, default `0`.
let g:asciidoctor_fold_options = 1

" List of filetypes to highlight, default `[]`
let g:asciidoctor_fenced_languages = ['python', 'c', 'bash']

" Function to create buffer local mappings and add default compiler
fun! AsciidoctorMappings()
    nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
    nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
    nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
    nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
    nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
    nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
    nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
    nnoremap <buffer> <leader>p :AsciidoctorPasteImage<CR>
    " :make will build pdfs
    compiler asciidoctor2pdf
endfun

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
    au!
    au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END

" -▲-

" Configure terraform
" -▼-
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
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

" Format.
" -▼-
nnoremap <leader>g gqip
vnoremap <leader>g gqip
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

" Fixed width!
autocmd FileType text,mail,tex,xhtml,html,markdown,c,cpp,python,rst,gitcommit,asciidoctor set textwidth=78

" No spelling on YAML & Docker files… I mean, really?
autocmd FileType yaml set nospell
autocmd FileType dockerfile set nospell

" Stupid tabs.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Auto save: http://vim.wikia.com/wiki/Auto_save_files_when_focus_is_lost
au FocusLost * :wa
set autowriteall

let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
colorscheme nord

syntax enable
filetype plugin indent on

set completeopt=menuone,noinsert,noselect
set shortmess+=c
set expandtab
set smartindent
set ts=4 sts=4 sw=4
set cmdheight=1
set updatetime=50
set signcolumn=yes
set mouse=a

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" LUA LSP
"   https://github.com/neovim/nvim-lspconfig/blob/master/README.md#keybindings-and-completion
" -▼-
:lua << EOF
  local nvim_lsp = require('lspconfig')

  local on_attach = function(client, bufnr)
    require('completion').on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
          hi LspReferenceRead cterm=bold ctermbg=red guibg=black
          hi LspReferenceText cterm=bold ctermbg=red guibg=black
          hi LspReferenceWrite cterm=bold ctermbg=red guibg=black
          augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
        ]], false)
    end
  end

  local servers = {'pyright', 'gopls', 'rust_analyzer'}
  -- for _, lsp in ipairs(servers) do
  --   nvim_lsp[lsp].setup {
  --     on_attach = on_attach,
  --   }
  -- end
  for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" -▲-

" Tree sitter.
" -▼-
:lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,  -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF
" -▲-
