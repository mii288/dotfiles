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

source ~/ghq/github.com/mii288/utils/fish/config.fish

set -Ux EDITOR vim
