DISTRO=$(lsb_release -si)

if [[ $DISTRO == "Arch" ]]; then
  source "${ZDOTDIR:-$HOME/.zprezto/conda.arch.zsh}"
else
  source "${ZDOTDIR:-$HOME/.zprezto/conda.generic.zsh}"
fi
