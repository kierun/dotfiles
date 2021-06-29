" Command specific to running a GUI.
"set colorcolumn=81
set number
set ruler
set mouse=a

"function! IsOnSomeParticularMachine(hostname)
"    return match(system("echo -n $HOST"), a:hostname) >= 0
"endfunction
" Fonts.
" if IsOnSomeParticularMachine('nightwatch')
"     GuiFont! PragmataProMono Nerd Font:h9
" else
"     GuiFont! PragmataPro Nerd Font Mono:h9
" endif
"GuiFont! PragmataPro:h9
GuiFont! EssentialPragmataPro Nerd Font:h9

GuiTabline 0
GuiPopupmenu 0
GuiRenderLigature 1

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv

if @% == ""
  bd
endif
