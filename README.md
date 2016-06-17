# My dotfiles

## Setup
```bash
git clone --bare --recursive https://github.com/andihit/dotfiles.git $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
```

## Software
* i3, rofi, feh
* terminator

## Credits
* https://github.com/mitsuhiko/dotfiles
* https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
* https://unsplash.com/@carylenicole
