#Sources

source /etc/profile.d/gradle.sh
source /etc/profile.d/maven.sh

# Config

export XDG_CONFIG_HOME=~/.config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#bcbcbc,bold,underline"

# Tmux

if [ -n "$TMUX" ]; then
  export SSH_ASKPASS="${ZDOTDIR:-$HOME/.zprezto/scripts/askpass.sh}"
fi

# Binraries

export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

## Java
if [ -x "$(command -v java)" ]; then
  java_home="$(readlink -f $(which java))"
  java_bin_suffix='/bin/java'
  jre_suffix='/jre'
  if [[ $java_home == *$java_bin_suffix ]]; then
      java_home=${java_home%"$java_bin_suffix"}
      if [[ $java_home == *$jre_suffix ]]; then
        java_home=${java_home%"$jre_suffix"}
      fi
      export JAVA_HOME=$java_home
  fi
fi
