#Sources

source /etc/profile.d/gradle.sh
source /etc/profile.d/maven.sh

# Config

export XDG_CONFIG_HOME=~/.config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#bcbcbc,bold,underline"

# Tmux

if [ -n "$TMUX" ]; then
  export SSH_ASKPASS="${ZDOTDIR:-$HOME/.zprezto/scripts/askpass.sh}"
  export TERM='tmux-256color'
fi

# Binraries

export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
