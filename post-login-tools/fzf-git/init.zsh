# Return if requirements are not found.
if (( ! $+commands[git] || ! $+commands[fzf] || ! $+commands[fzf-tmux] )); then
  return 1
fi

source "${0:h}/external/fzf-git.sh"
