list:
	@echo "Available targets:"
	@for t in `grep -oP '^([a-zA-Z-]+)(?=:.*$$)' Makefile`; do \
        echo "  make $$t"; done

ghostty-osx:
	ln -snf `pwd`/config.osx ~/Library/Application\ Support/com.mitchellh.ghostty/config

ghostty-linux:
	ln -snf `pwd`/config.linux ~/.config/ghostty/config
