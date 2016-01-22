# Created by newuser for 5.1.1

# color
autoload -Uz colors
colors

# prompt
PROMPT="
%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

# auto complete
autoload -U compinit
compinit

# completion
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..

# auto cd
setopt auto_cd

# back alias
alias ...='cd ../..'
alias ....='cd ../../..'

# dir stack
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

# glob
setopt extended_glob

# no history
setopt hist_ignore_space

# word
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# japanese
setopt print_eight_bit

# eof
setopt ignore_eof

# wildcard in history
bindkey '^R' history-incremental-pattern-search-backward
