.PHONY: consolas
consolas:
	@echo Please install Consolas manually.

.PHONY: terminator
terminator: consolas
	mkdir -p ~/.config/terminator
	ln -snf $$(pwd)/terminator/config ~/.config/terminator/config

.PHONY: terminal
terminal:
	cat $$(pwd)/terminal/README.md