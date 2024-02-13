#Sources

source /etc/profile.d/gradle.sh
source /etc/profile.d/maven.sh

# Config

export XDG_CONFIG_HOME=~/.config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#bcbcbc,bold,underline"

# Binraries

export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH



