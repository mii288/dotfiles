fish_add_path /usr/local/sbin
fish_add_path /usr/local/bin

if test -e "/opt/homebrew/bin/brew"
  eval (/opt/homebrew/bin/brew shellenv)
end

if test -e "/home/linuxbrew/.linuxbrew/bin/brew" 
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

status --is-interactive; and source (nodenv init -|psub)
set -Ux fish_user_paths $HOME/.nodenv/bin $fish_user_paths

eval (direnv hook fish)
