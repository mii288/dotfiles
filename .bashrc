# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
set completion-ignore-case on
export TERM=xterm-256color

alias ls='ls -h'
alias ll='ls -l'
alias la='ls -a'
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias cl='clear'
alias vi='vim'
alias grep='grep --color'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
