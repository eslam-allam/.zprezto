DISTRO=$(lsb_release -si)

conda ()
{
  unset -f conda
  if [[ $DISTRO == "Arch" ]]; then
    source "${ZDOTDIR:-$HOME/.zprezto/conda.arch.zsh}"
  else
    source "${ZDOTDIR:-$HOME/.zprezto/conda.generic.zsh}"
  fi
  conda "$@"
}

