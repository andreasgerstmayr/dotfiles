.PHONY: polybar
polybar:
	mkdir -p ~/.config/polybar
	ln -snf $$(pwd)/polybar/config ~/.config/polybar/config

.PHONY: dunst
dunst:
	mkdir -p ~/.config/dunst
	ln -snf $$(pwd)/dunst/dunstrc ~/.config/dunst/dunstrc

.PHONY: i3
i3: polybar dunst
	mkdir -p ~/.config/i3
	ln -snf $$(pwd)/i3/config ~/.config/i3/config
	ln -snf $$(pwd)/profile ~/.profile
