#Sources

if [ -f /etc/profile.d/gradle.sh ]; then
  source /etc/profile.d/gradle.sh
fi

if [ -f /etc/profile.d/maven.sh ]; then
  source /etc/profile.d/maven.sh
fi

# Config

export XDG_CONFIG_HOME=~/.config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#bcbcbc,bold,underline"

# Binraries

if [ -x "$(command -v go)" ]; then
  export PATH=$PATH:$(go env GOPATH)/bin
fi

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

export PANDOC_CONFIG="$HOME/.pandoc"
