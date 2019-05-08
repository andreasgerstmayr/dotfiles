.PHONY: git
git:
	ln -snf $$(pwd)/git/gitconfig ~/.gitconfig
	ln -snf $$(pwd)/git/globalgitignore ~/.globalgitignore

.PHONY: git-work
git-work:
	sed 's/andreas@gerstmayr.me/agerstmayr@redhat.com/' $$(pwd)/git/gitconfig > ~/.gitconfig
	ln -snf $$(pwd)/git/globalgitignore ~/.globalgitignore

.PHONY: vim
vim:
	mkdir -p ~/.vim
	ln -snf $$(pwd)/vim/autoload ~/.vim/autoload
	ln -snf $$(pwd)/vim/bundle ~/.vim/bundle
	ln -snf $$(pwd)/vim/vimrc ~/.vimrc

.PHONY: tmux
tmux:
	ln -snf $$(pwd)/tmux/.tmux/.tmux.conf ~/.tmux.conf
	ln -snf $$(pwd)/tmux/.tmux/.tmux.conf.local ~/.tmux.conf.local