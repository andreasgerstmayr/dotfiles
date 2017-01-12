.PHONY: usage
usage:
	@echo Available targets:
	@make -rpn | sed -n -e '/^$$/ { n ; /^[^ .#][^ ]*:/ { s/:.*$$// ; p ; } ; }' | sort

.PHONY: update-submodules
update-submodules:
	git submodule update --init --recursive --remote

.PHONY: git
git:
	ln -snf $$(pwd)/git/gitconfig ~/.gitconfig
	ln -snf $$(pwd)/git/globalgitignore ~/.globalgitignore

.PHONY: zsh
zsh: update-submodules
	ln -snf $$(pwd)/zsh/zprezto ~/.zprezto
	ln -snf $$(pwd)/zsh/zprezto/runcoms/zlogin ~/.zlogin
	ln -snf $$(pwd)/zsh/zprezto/runcoms/zlogout ~/.zlogout
	ln -snf $$(pwd)/zsh/zprezto/runcoms/zprofile ~/.zprofile
	ln -snf $$(pwd)/zsh/zprezto/runcoms/zshenv ~/.zshenv
	ln -snf $$(pwd)/zsh/zshrc ~/.zshrc
	ln -snf $$(pwd)/zsh/zpreztorc ~/.zpreztorc

.PHONY: vim
vim: update-submodules
	mkdir -p ~/.vim
	ln -snf $$(pwd)/vim/autoload ~/.vim/autoload
	ln -snf $$(pwd)/vim/bundle ~/.vim/bundle
	ln -snf $$(pwd)/vim/vimrc ~/.vimrc

.PHONY: tmux
tmux: update-submodules
	ln -snf $$(pwd)/tmux/.tmux/.tmux.conf ~/.tmux.conf
	ln -snf $$(pwd)/tmux/.tmux/.tmux.conf.lobal ~/.tmux.conf.local

.PHONY: i3blocks
i3blocks:
	mkdir -p ~/.config/i3blocks
	ln -snf $$(pwd)/i3blocks/config ~/.config/i3blocks/config
	ln -snf $$(pwd)/i3blocks/scripts ~/.config/i3blocks/scripts

.PHONY: i3
i3: i3blocks
	mkdir -p ~/.config/i3
	ln -snf $$(pwd)/i3/config ~/.config/i3/config
	ln -snf $$(pwd)/resources/wallpapers ~/.config/i3/wallpapers

.PHONY: consolas
consolas:
	@echo Please install Consolas manually.

.PHONY: terminator
terminator: consolas
	mkdir -p ~/.config/terminator
	ln -snf $$(pwd)/terminator/config ~/.config/terminator/config

.PHONY: terminal
terminal:
	cat $$(pwd)/terminal/README.md

.PHONY: hidpi
hidpi:
	ln -snf $$(pwd)/hidpi/xprofile ~/.xprofile
	ln -snf $$(pwd)/hidpi/Xresources ~/.Xresources
