alias alias-config="${EDITOR} ~/.zprezto/aliases.zsh"
alias zsh-config="${EDITOR} ~/.zshrc"
alias zprezto="${EDITOR} ~/.zpreztorc"
alias zprezto-config="${EDITOR} ~/.zprezto/config.zsh"
alias kittyconf="${EDITOR} ~/.config/kitty/kitty.conf"
alias env-config="${EDITOR} ~/.zprezto/env.zsh"

alias v="open_editor_in_file $EDITOR"
alias lv="open_editor_in_file ~/.local/bin/lvim"

if [ -x "$(command -v batcat)" ]; then
    alias bat="batcat"
fi

if [ -x "$(command -v exa)" ]; then
    alias ls="exa --icons"
    alias la="exa --header --long --all --group --icons"
fi

#if [ "$TERM" = "xterm-kitty" ]; then
#    alias ssh="kitty +kitten ssh"
#fi

