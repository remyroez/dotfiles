# Created by newuser for 5.1.1

# env
export LANG=ja_JP.UTF-8

# emacs-like
bindkey -e

# go
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
export GHQ_ROOT=$GOPATH/src

# color
autoload -Uz colors
colors

#setopt prompt_subst
#autoload -Uz add-zsh-hook
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
#zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
#zstyle ':vcs_info:*' get-revision true
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:*' max-exports 6
#_vcs_precmd() {
#    vcs_info
#    PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~ %{${vcs_info_msg_0_}%}
#%# "
#}
#add-zsh-hook precmd _vcs_precmd

# prompt
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
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

# Make sure to use double quotes to prevent shell expansion
zplug "b4b4r07/enhancd",   of:enhancd.sh
zplug "b4b4r07/emoji-cli", if:"which jq"
zplug "mrowa44/emojify",   as:command
#zplug "junegunn/fzf-bin",  as:command, from:gh-r, file:"fzf"
#zplug "peco/peco",         as:command, from:gh-r
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
#zplug "zsh-users/zsh-syntax-highlighting", nice:19

# Install plugins that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load --verbose
