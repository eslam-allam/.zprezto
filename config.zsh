if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='nano'
else
	if [ -x "$(command -v nvim)" ]; then
		export EDITOR='nvim'
	else
		export EDITOR='vi' 
	fi
 fi

# Zsh Autocpmplete
## Make Enter submit the command line straight from the menu.
#bindkey -M menuselect '\r' .accept-line
