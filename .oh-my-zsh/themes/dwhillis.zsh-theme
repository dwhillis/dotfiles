local user='%{$fg[magenta]%}%n@%{$fg[magenta]%}%m%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}("
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}"

PROMPT="${git_branch} ${pwd}$ "
#RPROMPT="${return_code} ${git_branch} ${rvm}"
RPROMPT=""
