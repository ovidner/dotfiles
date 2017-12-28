PROMPT='%{$fg[green]%}%n@%m:%{$fg_bold[blue]%}%3~%{$reset_color%}$(git_prompt_info)$(virtualenv_prompt_info)%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[red]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=" %{$fg_bold[yellow]%}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
