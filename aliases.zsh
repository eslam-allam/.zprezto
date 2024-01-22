alias alias-config="${EDITOR} ~/.zprezto/aliases.zsh"
alias zsh-config="${EDITOR} ~/.zshrc"
alias zprezto="${EDITOR} ~/.zpreztorc"
alias zprezto-config="${EDITOR} ~/.zprezto/config.zsh"
alias kittyconf="${EDITOR} ~/.config/kitty/kitty.conf"
alias env-config="${EDITOR} ~/.zprezto/env.zsh"

build_file_name ()
{
  FILE_NAME=$1
  parts=("${(@s[/])FILE_NAME}")
  last_item=${parts[-1]}

  if [[ -z $FILE_NAME ]]
  then
    echo ''
  elif [[ -f $FILE_NAME ]]
  then
    echo $FILE_NAME
  elif [[ -d $FILE_NAME ]]; then
    if [[ -z $last_item ]]; then
      echo "$FILE_NAME"
    else
      full_path=$( build_file_name "${FILE_NAME}/$( ls --no-icons $FILE_NAME | fzf-tmux -p --reverse )" )
      echo $full_path
    fi
  else
    echo ''
  fi
}

open_editor_in_file ()
{
  FILE_NAME=$2
  SELECTED_EDITOR=$1
  if [[ -z $SELECTED_EDITOR ]]; then
    SELECTED_EDITOR=$EDITOR
  fi
  if [[ -z $FILE_NAME ]]; then
    ls | fzf-tmux -p --reverse | { read file; build_file_name $file | read final; if [[ -n $final ]]; then $SELECTED_EDITOR $final; else echo "No files selected"; fi }
  else
    $SELECTED_EDITOR $FILE_NAME
  fi
}
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

