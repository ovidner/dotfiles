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
