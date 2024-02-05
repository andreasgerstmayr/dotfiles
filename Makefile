list:
	@grep -oP '^([a-zA-Z-]+)(?=:.*$$)' Makefile
	@for f in apps/*/Makefile system/*/Makefile; do \
      for t in `grep -oP '^([a-zA-Z-]+)(?=:.*$$)' $$f`; do \
        echo make -C `dirname $$f` $$t; done; done

submodules-update-local: # update submodules from this repository
	git submodule update --recursive --init

submodules-update-remote: # update submodules from remote
	git submodule update --recursive --remote

cli:
	make -C apps/git
	make -C apps/tmux
	make -C apps/vim
	make -C apps/zsh
