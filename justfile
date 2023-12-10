# update dotfiles repo
pull:
	git pull --recurse-submodules

# update submodules from this repository
update-submodules:
	git submodule update --recursive

# update submodules from remote
refresh-submodules:
	git submodule update --recursive --remote
