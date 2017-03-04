DEV_ROCKS = inspect luacheck

build: lint min

dev:
	@for rock in $(DEV_ROCKS) ; do \
		if ! luarocks list | grep $$rock > /dev/null ; then \
      echo $$rock not found, installing via luarocks... ; \
      luarocks install $$rock ; \
    else \
      echo $$rock already installed, skipping ; \
    fi \
	done;
	@yarn global add luamin

lint:
	@luacheck -q chipmunk.lua

min:
	@luamin -f chipmunk.lua > chipmunk_min.lua
