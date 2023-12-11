list:
	@just --list
	@for app in */*; do if [[ -f $app/justfile ]]; then just --list --list-heading "" --list-prefix "    $app/" $app/; fi; done

# update dotfiles repo
pull:
	git pull --recurse-submodules

# update submodules from this repository
update-submodules:
	git submodule update --recursive

# update submodules from remote
refresh-submodules:
	git submodule update --recursive --remote
