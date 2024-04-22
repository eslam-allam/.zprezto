alias alias-config="${EDITOR} ~/.zprezto/aliases.zsh"
alias zsh-config="${EDITOR} ~/.zshrc"
alias zprezto="${EDITOR} ~/.zpreztorc"
alias zprezto-config="${EDITOR} ~/.zprezto/config.zsh"
alias kittyconf="${EDITOR} ~/.config/kitty/kitty.conf"
alias env-config="${EDITOR} ~/.zprezto/env.zsh"

alias v="open_editor_in_file $EDITOR"
alias lv="open_editor_in_file ~/.local/bin/lvim"

alias alt="sudo update-alternatives --config"

if [ -x "$(command -v batcat)" ]; then
    alias bat="batcat"
fi

if [ -x "$(command -v eza)" ]; then
    alias ls="eza --icons auto"
    alias la="eza --header --long --all --group --icons auto"
fi

if [ "$TERM" = "xterm-kitty" ]; then
   alias ssh="kitty +kitten ssh"
fi

