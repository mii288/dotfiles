fish_add_path /usr/local/sbin
fish_add_path /usr/local/bin

if test -d "/opt/homebrew/bin/brew"
  eval (/opt/homebrew/bin/brew shellenv)
end

if test -d "/home/linuxbrew/.linuxbrew/bin/brew" 
  eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

status --is-interactive; and source (nodenv init -|psub)
eval (direnv hook fish)
