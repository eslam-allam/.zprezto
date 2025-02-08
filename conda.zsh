DISTRO=$(lsb_release -si)

conda ()
{
  if [[ -z "$CONDA_ACTIVE" ]]; then
    if [[ $DISTRO == "Arch" ]]; then
      source "${ZDOTDIR:-$HOME/.zprezto/conda.arch.zsh}"
    else
      source "${ZDOTDIR:-$HOME/.zprezto/conda.generic.zsh}"
    fi
    export CONDA_ACTIVE=1
    conda "$@"
  else
    conda "$@"
  fi
}

