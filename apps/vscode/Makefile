exts := eamodio.gitlens \
	  EditorConfig.EditorConfig \
	  ms-vscode-remote.remote-ssh \

vscode:
	ln -snf `pwd`/settings.json ~/.config/Code/User/settings.json

vscode-exts:
	for ext in $(exts); do code --install-extension $$ext; done
