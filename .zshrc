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

# directory bookmarks
hash -d sem8="/Users/andihit/Dropbox/Uni/TU Wien/Semester8"
hash -d bac="/Users/andihit/Dropbox/Uni/TU Wien/Semester8/bachelor-thesis"
hash -d ben="/Users/andihit/Dropbox/Uni/TU Wien/Semester8/bachelor-thesis/benchmarks"

# don't add hidden files to tar archives
export COPYFILE_DISABLE=true
