fish_add_path /usr/local/sbin
fish_add_path /usr/local/bin

eval (/opt/homebrew/bin/brew shellenv)

status --is-interactive; and source (nodenv init -|psub)
eval (direnv hook fish)
