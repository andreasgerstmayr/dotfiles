cli:
	make -C shells/bash
	make -C shells/zsh
	make -C tools/git
	make -C tools/tmux
	make -C tools/vim

xorg:
	make -C wms/wallpapers
	make -C wms/xorg

wayland:
	make -C wms/wallpapers
	make -C wms/wayland

refresh-submodules:
	git submodule update --recursive --remote
