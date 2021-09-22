default: install

consolas:
	@echo Please install Consolas manually.

install: consolas
	mkdir -p ~/.config/tilix/schemes
	ln -snf $$(pwd)/mitsuhiko.json ~/.config/tilix/schemes/mitsuhiko.json

save-config:
	dconf dump /com/gexperts/Tilix/ > tilix.dconf

restore-config:
	dconf load /com/gexperts/Tilix/ < tilix.dconf
