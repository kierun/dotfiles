" Command specific to running a GUI.
set number
set colorcolumn=81
set ruler

function! IsOnSomeParticularMachine(hostname)
    return match($HOST, a:hostname) >= 0
endfunction

" Fonts.
"GuiFont Terminess Powerline:h8
"GuiFont! InputMonoNarrow Nerd Font:h8
"GuiFont! InconsolataForPowerline Nerd Font:h10
"GuiFont! PragmataPro Nerd Font:h9
"GuiFont! MPlus Nerd Font:h9
"GuiFont! Iosevka Nerd Font:h9
if IsOnSomeParticularMachine('jagupard')
    GuiFont! PragmataProMono NF:h10
else
    GuiFont! PragmataProMono NF:h9
endif

" No ugly tab line in windows!
GuiTabline 0

"
if @% == ""
  bd
endif
