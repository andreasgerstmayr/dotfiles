.PHONY: default
default: dotfiles

.PHONY: update
update:
	sudo apt update
	sudo apt dist-upgrade

.PHONY: basics
basics: update
	# sysstat is required for cpu stats in i3blocks
	# compton for transparency of the i3bar
	sudo apt install git zsh vim tmux terminator feh rofi fonts-font-awesome fonts-powerline sysstat compton cscope exuberant-ctags

.PHONY: i3gaps-deps
i3gaps-deps: update
	# https://github.com/Airblader/i3/wiki/Compiling-&-Installing
	sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev

/usr/bin/i3: basics i3gaps-deps
	# https://github.com/Airblader/i3/wiki/Compiling-&-Installing
	cd $$(mktemp -d) && \
	git clone https://github.com/Airblader/i3.git i3-gaps && \
	cd i3-gaps && \
	autoreconf --force --install && \
	mkdir build && cd build && \
	../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && \
	make && \
	sudo make install

/usr/bin/i3blocks: basics
	# https://github.com/Airblader/i3blocks-gaps
	cd $$(mktemp -d) && \
	git clone https://github.com/Airblader/i3blocks-gaps.git && \
	cd i3blocks-gaps && \
	make && \
	sudo make install PREFIX=/usr

.PHONY: dotfiles
dotfiles: basics /usr/bin/i3 /usr/bin/i3blocks
	make -C ../ git zsh vim tmux i3 terminator
	chsh -s $$(which zsh)
