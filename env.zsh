source /etc/profile.d/gradle.sh
source /etc/profile.d/maven.sh
export XDG_CONFIG_HOME=~/.config
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$HOME/.local/bin:$PATH
