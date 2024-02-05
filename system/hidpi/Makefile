all: gnome firefox thunderbird obsidian chromium

# enable fractional scaling in gnome
gnome:
	dconf load / < gnome-hidpi

firefox:
	flatpak --user override --env MOZ_ENABLE_WAYLAND=1 org.mozilla.firefox

thunderbird:
	flatpak --user override --env MOZ_ENABLE_WAYLAND=1 org.mozilla.Thunderbird

obsidian:
	flatpak --user override --socket=wayland md.obsidian.Obsidian

chromium:
	ln -snf `pwd`/chromium-flags.conf ~/.var/app/org.chromium.Chromium/config
