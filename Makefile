.PHONY: usage
usage:
	@echo Available targets:
	@make -rpn | sed -n -e '/^$$/ { n ; /^[^ .#][^ ]*:/ { s/:.*$$// ; p ; } ; }' | sort

.PHONY: update-submodules
update-submodules:
	git submodule update --init --recursive

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

.PHONY: i3
i3:
	mkdir -p ~/.config/i3
	ln -snf $$(pwd)/i3/config ~/.config/i3/config

.PHONY: terminator
terminator:
	mkdir -p ~/.config/terminator
	ln -snf $$(pwd)/terminator/config ~/.config/terminator/config

.PHONY: terminal
terminal:
	cat $$(pwd)/terminal/README.md

.PHONY: fonts
fonts:
	@echo Please install Consolas manually.

.PHONY: hidpi
hidpi:
	ln -snf $$(pwd)/hidpi/xprofile ~/.xprofile
	ln -snf $$(pwd)/hidpi/Xresources ~/.Xresources

.PHONY: macbook
macbook: git zsh vim tmux

.PHONY: ubuntuvm
ubuntuvm: git zsh vim tmux i3 terminator hidpi fonts
