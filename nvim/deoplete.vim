" deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" disable autocomplete by default
" let b:deoplete_disable_auto_complete=1 
" let g:deoplete_disable_auto_complete=1
" call deoplete#custom#buffer_option('auto_complete', v:false)

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" set sources
let g:deoplete#sources = {}
let g:deoplete#sources.cpp = ['LanguageClient']
let g:deoplete#sources.python = ['LanguageClient']
let g:deoplete#sources.python3 = ['LanguageClient']
let g:deoplete#sources.c = ['LanguageClient']
let g:deoplete#sources.vim = ['vim']

" deoplete-racer config
" let g:deoplete#sources#rust#racer_binary='/Users/aenayet/.cargo/bin/racer'
" let g:deoplete#sources#rust#rust_source_path= '/Users/aenayet/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
