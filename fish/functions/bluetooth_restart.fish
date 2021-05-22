function bluetooth_restart
  blueutil -p 0 && sleep 1 && blueutil -p 1
end