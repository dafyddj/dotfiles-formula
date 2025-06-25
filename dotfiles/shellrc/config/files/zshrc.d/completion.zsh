# shellcheck shell=sh

if type brew &>/dev/null; then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
  fpath=($(brew --prefix)/share/zsh-completions $fpath)
fi

# Use modern completion system
autoload -Uz compinit
compinit
