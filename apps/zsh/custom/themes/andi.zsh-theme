#
# Theme based on mitsuhikos prompt: https://github.com/mitsuhiko/dotfiles/blob/master/zsh/custom/themes/mitsuhiko.zsh-theme
#
# %b ... resets bold
#

setopt prompt_subst

export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
export CLICOLOR=1
local reset_fg="%f"

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[blue]%}git%{$reset_fg%}:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%B"
ZSH_THEME_GIT_PROMPT_DIRTY="%B%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_BRANCH=""
ZSH_THEME_GIT_PROMPT_STAGED="%B%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="%B%{$fg[green]?%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%B%{$fg[cyan]%}%{+%G%}"

ZSH_THEME_VIRTUALENV_PREFIX=" workon %{$fg[cyan]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_fg%}"

# This is the basic prompt that is always printed.  It will be
# enclosed to make it newline.
_MITSUHIKO_PROMPT='%B%{$fg[magenta]%}%n${reset_fg} at %{$fg[yellow]%}%m${reset_fg} in %{$fg[green]%}%~${reset_fg}%'

# Conditionally print command execution time
_MITSUHIKO_PROMPT_TIME_TRESHOLD=60

# The extra whitespace before the newline is necessary to avoid
# some rendering bugs.
PROMPT=$'\n'$_MITSUHIKO_PROMPT' ${_OMZ_ASYNC_OUTPUT[_mitsuhiko_async_handler]}'$' \n$%b '

# Show time on the right side.
local _lineup=$'\e[1A'
local _linedown=$'\e[1B'
RPROMPT=%{${_lineup}%}'%B[%*]%b'%{${_linedown}%}

# Remove the default git var update from chpwd and precmd to speed
# up the shell prompt.  We will do the precmd_update_git_vars in
# the async handler instead
chpwd_functions=("${(@)chpwd_functions:#chpwd_update_git_vars}")
precmd_functions=("${(@)precmd_functions:#precmd_update_git_vars}")

function minikube_prompt_info() {
  if [[ -n "$MINIKUBE_ACTIVE_DOCKERD" ]]; then
    echo " docker:%{$fg[yellow]%}minikube%{$reset_fg%}"
  fi
}

function kubectx_prompt_info_custom() {
  local kubectx
  kubectx=$(kubectx_prompt_info)
  if [[ -z "${kubectx}" || "${kubectx}" == "minikube" ]]; then
  elif [[ "${kubectx}" == *observability* ]]; then
    echo " kube:%{$fg[yellow]%}devcluster%{$reset_fg%}"
  else
    echo " kube:%{$fg[yellow]%}${kubectx}%{$reset_fg%}"
  fi
}

# Store command start time
function _mitsuhiko_preexec() {
  _mitsuhiko_cmd_start=$SECONDS
}

# Capture exit code and command duration before the async handler
# forks, so the subprocess inherits correct values.
function _mitsuhiko_precmd() {
  _mitsuhiko_rv=$?

  if [[ -n $_mitsuhiko_cmd_start ]]; then
    _mitsuhiko_cmd_duration=$(($SECONDS - _mitsuhiko_cmd_start))
    unset _mitsuhiko_cmd_start # clear start time; required for empty commands
  else
    _mitsuhiko_cmd_duration=0
  fi
}

# Async handler: runs in a subprocess via _omz_register_handler,
# outputs the dynamic prompt fragment to stdout.
function _mitsuhiko_async_handler() {
  precmd_update_git_vars

  echo -n "$(git_super_status)$(virtualenv_prompt_info)$(minikube_prompt_info)$(kubectx_prompt_info_custom)"
  if [[ $_mitsuhiko_cmd_duration -gt $_MITSUHIKO_PROMPT_TIME_TRESHOLD ]]; then
    echo -n " took %{$fg[red]%}$(($_mitsuhiko_cmd_duration/60))m%{$reset_fg%}"
  fi
  if [[ $_mitsuhiko_rv -ne 0 ]]; then
    echo -n " exited %{$fg[red]%}$_mitsuhiko_rv%{$reset_fg%}"
  fi
}

# Prepend our precmd so it runs before _omz_async_request
# (which forks the handler subprocess and needs our globals set).
precmd_functions=(_mitsuhiko_precmd "${precmd_functions[@]}")
preexec_functions+=(_mitsuhiko_preexec)

# Register the async handler with OMZ's async prompt system
_omz_register_handler _mitsuhiko_async_handler
