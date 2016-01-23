# Created by newuser for 5.1.1

# go
export GOROOT=/mingw64/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

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
#bindkey '^R' history-incremental-pattern-search-backward

# Check if zplug is installed
[[ -d ~/.zplug ]] || {
  curl -fLo ~/.zplug/zplug --create-dirs https://git.io/zplug
  source ~/.zplug/zplug && zplug update --self
}

# Essential
source ~/.zplug/zplug

zplug "b4b4r07/zplug"

# Local loading
zplug "~/.zsh", from:local

# Install plugins that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load
