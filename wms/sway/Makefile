.PHONY: waybar
waybar:
	mkdir -p ~/.config/waybar
	ln -snf $$(pwd)/waybar/config ~/.config/waybar/config
	ln -snf $$(pwd)/waybar/style.css ~/.config/waybar/style.css

.PHONY: sway
sway: waybar
	mkdir -p ~/.config/sway
	ln -snf $$(pwd)/sway/config ~/.config/sway/config