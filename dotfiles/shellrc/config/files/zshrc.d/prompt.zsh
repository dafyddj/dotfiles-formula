# shellcheck shell=sh

GIT_PROMPT_PATH="{{ dotfiles.git.prompt_path }}"

if test -r "$GIT_PROMPT_PATH"; then
  # shellcheck source=/dev/null
  . "$GIT_PROMPT_PATH"
  precmd () { __git_ps1 ":%F{blue}%~%F{yellow}" "%f%% " " (%s)" }
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
fi
