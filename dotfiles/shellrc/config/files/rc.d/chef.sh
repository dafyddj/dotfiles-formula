# shellcheck shell=sh

if command -v chef > /dev/null 2>&1; then
  USERS_SHELL=$(basename "$SHELL")
  eval "$(chef shell-init "$USERS_SHELL")"
fi
