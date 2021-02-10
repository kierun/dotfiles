" Command specific to running a GUI.
set number
set colorcolumn=81
set ruler

function! IsOnSomeParticularMachine(hostname)
    return match(system("echo -n $HOST"), a:hostname) >= 0
endfunction

" Fonts.
" if IsOnSomeParticularMachine('nightwatch')
"     GuiFont! PragmataProMono Nerd Font:h9
" else
"     GuiFont! PragmataPro Nerd Font Mono:h9
" endif
GuiFont! PragmataPro Nerd Font Mono:h9
"
" GuiFont! VictorMono Nerd Font Mono:h9

" No ugly tab line in windows!
GuiTabline 0
"GuiRenderLigature 1

GuiPopupmenu 0

"
if @% == ""
  bd
endif
