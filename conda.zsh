DISTRO=$(lsb_release -si)

conda ()
{
  if [[ $DISTRO == "Arch" ]]; then
    source "${ZDOTDIR:-$HOME/.zprezto/conda.arch.zsh}"
  else
    source "${ZDOTDIR:-$HOME/.zprezto/conda.generic.zsh}"
  fi
  unset -f conda
  conda "$@"
}

