# shellcheck shell=sh

__git_ps1_venv() {
   local pre="$1"
   local post="$2"

   if [ -n "${VIRTUAL_ENV}" ]; then
      pre="%F{yellow}(`basename \"$VIRTUAL_ENV\"`)%f${pre}"
   fi

   __git_ps1 "${pre}" "${post}"
}

VIRTUAL_ENV_DISABLE_PROMPT=true

GIT_PROMPT_PATH="{{ dotfiles.git.prompt_path }}"

if test -r "$GIT_PROMPT_PATH"; then
  # shellcheck source=/dev/null
  . "$GIT_PROMPT_PATH"
  precmd () { __git_ps1_venv ":%F{blue}%~%F{yellow}" "%f%% " }
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
fi
