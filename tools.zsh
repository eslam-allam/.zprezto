if command -v fd &> /dev/null; then
  INIT_FILES=$(fd --type file 'init.zsh' "${ZDOTDIR:-$HOME/.zprezto/post-login-tools}")
else
  INIT_FILES=$(find "${ZDOTDIR:-$HOME/.zprezto/post-login-tools}" -type f -name 'init.zsh')
fi

while IFS=$'\n' read -r file; do
  source "$file"
done <<< "$INIT_FILES"
