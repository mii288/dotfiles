function peco_tmux_session
  set session (tmux list-sessions | peco | awk -F ':' ' {print $1}')
  if test -n "$session"
    tmux a -dt $session
  end
end