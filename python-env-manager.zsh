if command -v micromamba &> /dev/null; then
  source "${ZDOTDIR:-$HOME/.zprezto/micromamba.zsh}"
  elif command -v conda &> /dev/null; then
    source "${ZDOTDIR:-$HOME/.zprezto/conda.zsh}"
  else
    echo "Conda and Micromamba not found!!!"
fi
