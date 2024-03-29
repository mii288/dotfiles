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

if test -e ~/ghq/github.com/mii288/utils/fish/config.fish
    source ~/ghq/github.com/mii288/utils/fish/config.fish
end

set -Ux EDITOR vim
set -Ux PYTHON /opt/homebrew/bin/python3.10
