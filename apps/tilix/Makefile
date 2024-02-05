tilix: consolas
	mkdir -p ~/.config/tilix/schemes
	ln -snf `pwd`/mitsuhiko.json ~/.config/tilix/schemes/mitsuhiko.json

consolas:
	@echo Please install Consolas manually.

save-config:
	dconf dump /com/gexperts/Tilix/ > tilix.dconf

restore-config:
	dconf load /com/gexperts/Tilix/ < tilix.dconf
