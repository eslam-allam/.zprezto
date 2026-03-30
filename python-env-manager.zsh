if command -v micromamba &> /dev/null; then
  source "${ZDOTDIR:-$HOME/.zprezto/micromamba.zsh}"
  elif command -v conda &> /dev/null; then
    source "${ZDOTDIR:-$HOME/.zprezto/conda.zsh}"
  elif command -v pixi &> /dev/null; then
    # Do nothing
  else
    echo "Conda, Micromamba, Pixi not found!!!"
fi
