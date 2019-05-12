.PHONY: shells
shells:
	make -C shells bash zsh

.PHONY: tools
tools:
	make -C tools git tmux vim

.PHONY: cli
cli: shells tools

.PHONY: i3
i3:
	make -C wms/i3 i3
	make -C wms/wallpapers fetch


.PHONY: sway
sway:
	make -C wms/sway sway
	make -C wms/wallpapers fetch
