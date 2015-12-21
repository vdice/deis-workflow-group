.PHONY: checkout
checkout:
	git submodule update --init --recursive

.PHONY: update
update:
	git submodule update --init --recursive --remote
