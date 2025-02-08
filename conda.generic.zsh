
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/eslamallam/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/eslamallam/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/eslamallam/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/eslamallam/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# Redefine conda command, part a: Keep copy of original conda command/function
eval "original_$(declare -f conda)" 2> /dev/null
if [ $? -ne 0 ]; then
    original_conda () {
      command conda "$@"
    }
fi
# Redefine conda command, part b: Add new functionality related to items (i) and (ii).
conda () {
  # Run the regular conda
  original_conda "$@"
  local CONDA_RTN_CODE=$?

  # Keep a copy of CONDA_DEFAULT_ENV to restore the environment if, e.g.,
  # 'source ~/.bashrc' is run
  CONDA_DEFAULT_ENV_COPY=$CONDA_DEFAULT_ENV

  # Stop and return original_conda's return code if it fails
  [ $CONDA_RTN_CODE -ne 0 ] && return $CONDA_RTN_CODE

  # Do tmux-related stuff, but only if tmux is running and "$@" contains substring "activate"
  if [[ -n "$TMUX" ]] && [[ "$@" =~ .*"activate".* ]]; then
    # Create/update the *tmux* session env var "TMUX_SESSION_CONDA_ENVS"
    local TMUX_SESSION_CONDA_ENVS=$(tmux showenv TMUX_SESSION_CONDA_ENVS 2>/dev/null)
    if [[ $? -eq 0 ]]; then
      # Get list of conda envs for all panes except the current one
      local OLD_VALUES=$(echo $TMUX_SESSION_CONDA_ENVS | sed "s/TMUX_SESSION_CONDA_ENVS=//")
      local CONDA_ENV_OTHER_PANES=$(echo $OLD_VALUES | sed "s/$TMUX_PANE:\w*[[:space:]]*//g")
    fi
    # Include current pane's conda env info
    tmux setenv TMUX_SESSION_CONDA_ENVS "$TMUX_PANE:$CONDA_DEFAULT_ENV $CONDA_ENV_OTHER_PANES"
  fi
}

if [[ -n "$TMUX_PARENT_PANE_ID" ]]; then
    # Remember: "TMUX_SESSION_CONDA_ENVS", as per our redefined "conda" command, carries
    # info about changes in the the conda environments in all the session's panes.
    # TMUX_PARENT_PANE_ID makes it thus possible to query, from any child
    # pane, its parent's conda environment at the time the child was created.
    # This is exactly what will be done now.
    TMUX_SESSION_CONDA_ENVS=$(tmux showenv TMUX_SESSION_CONDA_ENVS 2>/dev/null)
    if [ $? -eq 0 ]; then
        PATT="(?<=${TMUX_PARENT_PANE_ID}:).*?(?=([[:space:]]|$))"
        PARENT_CONDA_ENV=$(echo $TMUX_SESSION_CONDA_ENVS | grep -oP "$PATT" | head -1)
        #echo "Activate conda env '$PARENT_CONDA_ENV' of parent tmux pane '$TMUX_PARENT_PANE_ID'"
        conda activate $PARENT_CONDA_ENV
    fi
    # Clean up the pane's env (TMUX_SESSION_CONDA_ENVS remains in the tmux session env)
    unset TMUX_SESSION_CONDA_ENVS PATT PARENT_CONDA_ENV
    # Erase memory of parent tmux pane's ID so that the 'else' block below
    # is run if we re-source bashrc
    unset TMUX_PARENT_PANE_ID
else
    # Triger update of TMUX_SESSION_CONDA_ENVS and CONDA_DEFAULT_ENV_COPY
    # when the pane has no parent (very first pane or a pane where bashrc was
    # re-sourced after creation).
    [[ -n "$CONDA_DEFAULT_ENV_COPY" ]] && echo "Activate previous conda env '$CONDA_DEFAULT_ENV_COPY'"
    conda activate $CONDA_DEFAULT_ENV_COPY
fi
