all: gnome dash-to-dock firefox-hide-rpm

gnome:
	dconf load / < gnome.ini

dash-to-dock:
	dconf load / < dash-to-dock.ini

# hide application icon of Firefox RPM package
firefox-hide-rpm:
	printf '[Desktop Entry]\nNoDisplay=true\n' > ~/.local/share/applications/firefox.desktop

dump-settings:
	dconf dump /
