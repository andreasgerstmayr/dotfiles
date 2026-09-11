git:
	ln -snf `pwd`/gitconfig ~/.gitconfig
	ln -snf `pwd`/gitignore_global ~/.gitignore_global

git-work:
	rm -f ~/.gitconfig
	cp `pwd`/gitconfig ~/.gitconfig
	sed -i 's/andreas@gerstmayr.me/agerstmayr@redhat.com/' ~/.gitconfig
	ln -snf `pwd`/gitignore_global ~/.gitignore_global
