set nocompatible
filetype plugin indent on
syntax on
set hidden
set runtimepath^=~/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.cache/dein'))
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
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
call dein#end()
