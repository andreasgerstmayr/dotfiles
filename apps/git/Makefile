git:
	ln -snf `pwd`/gitconfig ~/.gitconfig
	ln -snf `pwd`/gitignore_global ~/.gitignore_global

git-work:
	rm -f ~/.gitconfig
	sed 's/andreas@gerstmayr.me/agerstmayr@redhat.com/' `pwd`/gitconfig > ~/.gitconfig
	ln -snf `pwd`/gitignore_global ~/.gitignore_global
