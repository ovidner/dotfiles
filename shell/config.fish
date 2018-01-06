set fish_greeting
set -x CODE $HOME/Code
set -x LANG en_US.UTF-8
set -x PIPENV_SHELL_FANCY true
set -x SHELL /usr/local/bin/fish
set -x VIRTUAL_ENV_DISABLE_PROMPT true

if status --is-login
  set -gx PATH /usr/local/sbin $PATH
  set -gx PATH /usr/local/opt/gettext/bin $PATH
  set -gx PATH $HOME/.local/bin $PATH
  eval (direnv hook fish)
end

function fish_prompt
  test "$USER" = 'root'
  and echo -n (set_color red)'# '

	test $SSH_TTY
  and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '

  echo -n (set_color green)(prompt_pwd)(set_color normal)' '
  echo -n (set_color cyan)(__fish_git_prompt "[%s]")' '
  echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end

function fish_right_prompt
  set -l _status $status
  set -l duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')

  echo -n ' '(set_color green)'❮'(set_color yellow)'❮'(set_color red)'❮ '

  test $VIRTUAL_ENV
  and echo -n (set_color yellow)'['(basename $VIRTUAL_ENV)'] '

  test $_status -ne 0
  and echo -n (set_color red)'⚡︎'$_status' '

  echo -n (set_color brblack)$duration
end
