claude:
	@if [ -d ~/.claude/skills ] && ! [ -L ~/.claude/skills ]; then \
		echo "~/.claude/skills is a directory, please remove it first"; \
		exit 1; \
	fi
	ln -snf `pwd`/skills ~/.claude/skills
