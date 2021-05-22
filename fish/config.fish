alias repo="peco_ghq_project"

# down-or-search	
## Down Arrow
bind -k down history-prefix-search-forward
bind \e\[B history-prefix-search-forward
## CTRL - n
bind \cn history-prefix-search-forward
# up-or-search	
## Up Arrow
bind -k up history-prefix-search-backward
bind \e\[A history-prefix-search-backward
## CTRL - p
bind \cp history-prefix-search-backward

# anyenv
status --is-interactive; and source (nodenv init -|psub)
status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)
