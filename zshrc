# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1024
SAVEHIST=1024
setopt hist_ignore_dups correct correct_all multios
setopt appendhistory autocd extendedglob nomatch notify autocd autopushd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ygolanski/.zshrc'

# Home brew.
export PATH=~/bin:\
~/.local/bin:\
~/.cargo/bin:\
/usr/local/bin:\
/usr/local/sbin:\
/usr/bin:\
/usr/sbin:\
/bin:\
/sbin

# Completion.
fpath+=~/.zfunc
autoload -Uz compinit
compinit -i

# Stupid GO and ./...
alias golint='nocorrect golint'

# End of lines added by compinstall
#
# http://www.rayninfo.co.uk/tips/zshtips.html
# http://grml.org/zsh/zsh-lovers.html
#

### Keys
typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

### Prompt
autoload -U colors && colors
source $HOME/.zsh/zsh-git-prompt/zshrc.sh
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{Σ%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✗%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✓%G%}"

source $HOME/.zsh/python_virtual_env.zsh
PROMPT='%(?.%F{green}√.%F{red}✗ %?)%f $(virtualenv_prompt_info)$(git_super_status)%{[38;5;24m%};%{[0m%} '

# PROMPT='%(?.%F{green}√.%F{red}✗ %?)%f %B%F{240}%1~%f%b %B%F{red}%#%f%b '
export TERM=tmux-256color
precmd () { print -Pn "\e]0;%n@%m: %~\a" }
preexec () { print -Pn "\e]0;%n@%m: $1\a" }

# if [[ ${TERM} == "xterm-256color" ]]; then
#   precmd () { print -Pn "\033k\033\134\033k%1d\033\134" }
#   preexec () { print -Pn "\033k\033\134\033k$1\033\134" }
# else
#   precmd () { print -Pn "\e]0;%n@%m: %~\a" }
#   preexec () { print -Pn "\e]0;%n@%m: $1\a" }
# fi

### Colours
# eval `dircolors ~/.dircolors.256dark`
eval `dircolors ~/.dircolors.nord`
cless () {
    pygmentize -gf terminal256 -O encoding=utf-8 -P style=friendly "$1" | less -R
}

### env
export LC_ALL=en_GB.UTF-8 
export LANGUAGE=en_GB.UTF-8                                                     
export LC_COLLATE=C                                                             
export LANG=en_GB.UTF-8 
export EDITOR=nvim
export PAGER=less
export LESSCHARSET=utf-8
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export PRINTER=HPPrinter
#export NOSE_REDNOSE=1
#export NOSE_DETAILED_ERRORS=1
#export NOSE_NOCAPTURE=1
nbr_cpu=`grep processor /proc/cpuinfo | wc -l`
#export NUM_CPU=${nbr_cpu}
export GTEST_COLOR=True
export MANPATH=~/man:~/share/man:
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

## Limits
limit core 1024M

### vim.
#editline() { gvim ${1%%:*} +${1##*:}; }

### Aliases
if [[ (( $+commands[ls] )) ]]; then
    alias ls='lsd -F --icon-theme fancy'
    alias tree='lsd --tree -A'
else
    alias ls='/bin/ls -bsFhv --color'
fi
if [[ (( $+commands[bat] )) ]]; then
    alias cat='bat'
fi

alias apg='pwgen -c -n -y 32 6'
alias nms='neomutt -f $HOME/Maildir/.spam'
alias nmy='neomutt -y'
alias nmz='neomutt -Z || true'
alias pwgen='pwgen -c -n -y 32 6'
alias rcp='rsync --archive --compress --progress'
alias rmpyc="find . -regex '.*\.pyc$' -delete"
alias scp='rsync --archive --compress --progress'

## Function to start tmux
mux () {tmux -2 new -s $1 || tmux attach -t $1}

# A command-line fuzzy finder -- https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fish?                                                                         
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh               
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# direnv
eval "$(direnv hook zsh)"

# psgrep from oh-my-zsh
# ps + grep.
psgrep() {
  local pids
  pids=$(pgrep -f $@)
  if ! [[ $pids ]]; then
    echo "No processes found." >&2; return 1
  fi
  ps up $(pgrep -f $@)
}

# Local npm path:
#   https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

## Local data: MUST BE LAST!!!
if [[ -e ~/.zsh/local ]]
then source ~/.zsh/local
fi

if whence -cp terraform > /dev/null 2>&1 
then
    autoload -U +X bashcompinit && bashcompinit
    complete -o nospace -C /usr/bin/terraform terraform
fi
