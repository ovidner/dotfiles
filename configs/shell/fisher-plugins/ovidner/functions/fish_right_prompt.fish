function fish_right_prompt
  set -l _status $status
  set -l duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')

  echo -n ' '(set_color green)'❮'(set_color yellow)'❮'(set_color red)'❮ '

  test $VIRTUAL_ENV
  and echo -n (set_color yellow)'['(basename $VIRTUAL_ENV)'] '

  test $_status -ne 0
  and echo -n (set_color red)$_status' '

  echo -n (set_color brblack)$duration
end
