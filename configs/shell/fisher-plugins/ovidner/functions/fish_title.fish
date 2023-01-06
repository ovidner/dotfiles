function fish_title
  test $SSH_TTY
  and echo -n $USER'@'(prompt_hostname)' '

  echo -n (prompt_pwd)' '

  test $argv
  and echo -n '🚂'$argv
end
