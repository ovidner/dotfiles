set fish_greeting
set -gx fish_user_abbreviations (ovidner_abbreviations)
set -x CODE $HOME/Code
set -x EDITOR "code --wait"
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x PIPENV_SHELL_FANCY true
set -x SHELL (which fish)
set -x VIRTUAL_ENV_DISABLE_PROMPT true

if status --is-login
  set -x PATH /usr/local/sbin $PATH
  set -x PATH /usr/local/opt/gettext/bin $PATH
  set -x PATH $HOME/.local/bin $PATH
  set -x PATH $HOME/.dotfiles/bin $PATH
end

if status --is-interactive
  eval (direnv hook fish)
end

function storePathForWindowsTerminal --on-variable PWD
  # Makes duplicate tabs open in the same directory in Windows Terminal
  # https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory#fish
  if test -n "$WT_SESSION"
    printf "\e]9;9;%s\e\\" (wslpath -w "$PWD")
  end
end
