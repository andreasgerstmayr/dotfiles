#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# aliases
unalias rm

# see https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if [[ "$OSTYPE" == darwin* ]]; then
  local dropbox="$HOME/Dropbox"
  export COPYFILE_DISABLE=true # don't add hidden files to tar archives
elif [[ "$OSTYPE" == "linux" ]]; then
  local dropbox="$HOME/Dropbox"
elif [[ "$OSTYPE" == "cygwin" ]]; then
  local dropbox="/cygdrive/c/Users/Andreas/Dropbox"
fi

# directory bookmarks
hash -d sem8="$dropbox/Uni/TU Wien/Semester8"
hash -d bac="$dropbox/Uni/TU Wien/Semester8/bachelor-thesis"
hash -d ben="$dropbox/Uni/TU Wien/Semester8/bachelor-thesis/benchmarks"
