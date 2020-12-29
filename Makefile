# This is a self-documenting Makefile, see https://www.thapaliya.com/en/writings/well-documented-makefiles/
default: help

##@ Targets

cli: ## cli tools
	make -C shells/bash
	make -C shells/zsh
	make -C tools/git
	make -C tools/tmux
	make -C tools/vim

xorg: ## Xorg environment
	make -C wms/wallpapers
	make -C wms/xorg

wayland: ## wayland environment
	make -C wms/wallpapers
	make -C wms/wayland

pull: ## update dotfiles repo
	git pull --recurse-submodules

refresh-submodules: ## update submodules
	git submodule update --recursive --remote


##@ Helpers

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
