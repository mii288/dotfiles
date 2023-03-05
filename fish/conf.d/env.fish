fish_add_path /usr/local/sbin
fish_add_path /usr/local/bin

eval (/opt/homebrew/bin/brew shellenv)

status --is-interactive; and source (nodenv init -|psub)
set -Ux fish_user_paths $HOME/.nodenv/bin $fish_user_paths

eval (direnv hook fish)
