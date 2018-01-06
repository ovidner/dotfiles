set fish_greeting
set -x CODE $HOME/Code
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x PIPENV_SHELL_FANCY true
set -x SHELL /usr/local/bin/fish
set -x VIRTUAL_ENV_DISABLE_PROMPT true

if status --is-login
  set -x PATH /usr/local/sbin $PATH
  set -x PATH /usr/local/opt/gettext/bin $PATH
  set -x PATH $HOME/.local/bin $PATH
  eval (direnv hook fish)
end
