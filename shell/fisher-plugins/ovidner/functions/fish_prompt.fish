function fish_prompt
  test "$USER" = 'root'
  and echo -n (set_color red)'# '

  test $SSH_TTY
  and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '

  echo -n (set_color green)(prompt_pwd)(set_color normal)' '
  echo -n (set_color cyan)(__fish_git_prompt "[%s]")' '
  echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end
