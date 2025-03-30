list:
	@echo "Available targets:"
	@for t in `grep -oP '^([a-zA-Z-]+)(?=:.*$$)' Makefile`; do \
        echo "  make $$t"; done

vscode-osx:
	ln -snf `pwd`/settings.json ~/Library/Application\ Support/Code/User/settings.json
	ln -snf `pwd`/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
	code --install-extension EditorConfig.EditorConfig

vscode-linux:
	ln -snf `pwd`/settings.json ~/.config/Code/User/settings.json
	ln -snf `pwd`/keybindings.json ~/.config/Code/User/keybindings.json
	code --install-extension EditorConfig.EditorConfig
	code --install-extension eamodio.gitlens
	code --install-extension ms-vscode-remote.remote-containers

vscode-wsl:
	cp settings.json /mnt/c/Users/Andreas/AppData/Roaming/Code/User/settings.json
	cp keybindings.json /mnt/c/Users/Andreas/AppData/Roaming/Code/User/keybindings.json
	cmd.exe /c code --install-extension EditorConfig.EditorConfig
	cmd.exe /c code --install-extension eamodio.gitlens
	cmd.exe /c code --install-extension ms-vscode-remote.remote-wsl
	cmd.exe /c code --install-extension ms-vscode-remote.remote-containers
