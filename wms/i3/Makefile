.PHONY: i3blocks
i3blocks:
	mkdir -p ~/.config/i3blocks
	ln -snf $$(pwd)/i3blocks/config ~/.config/i3blocks/config
	ln -snf $$(pwd)/i3blocks/scripts ~/.config/i3blocks/scripts

.PHONY: dunst
dunst:
	mkdir -p ~/.config/dunst
	ln -snf $$(pwd)/dunst/dunstrc ~/.config/dunst/dunstrc

.PHONY: i3
i3: i3blocks dunst
	mkdir -p ~/.config/i3
	ln -snf $$(pwd)/i3/config ~/.config/i3/config
	ln -snf $$(pwd)/xprofile ~/.xprofile
	ln -snf $$(pwd)/Xresources ~/.Xresources