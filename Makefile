GIT_SUBMODULE_EACH = git submodule foreach

.PHONY: clean
clean:
	git submodule foreach "git clean -fdx"

.PHONY: checkout
checkout: clean
	git submodule update --init --checkout --recursive -f

.PHONY: update
update: clean
	git submodule update --init --recursive --remote -f

.PHONY: tag
tag:
	$(GIT_SUBMODULE_EACH) "$$(cat gitscripts/tag)"

.PHONY: tag-delete
tag-delete:
	$(GIT_SUBMODULE_EACH) "$$(cat gitscripts/tag-delete)"

.PHONY: tag-push
tag-push:
	$(GIT_SUBMODULE_EACH) "git push --tags"

.PHONY: next-version
next-version:
	$(GIT_SUBMODULE_EACH) "$$(cat gitscripts/bumpver)"

.PHONY: push
push:
	$(GIT_SUBMODULE_EACH) "git push"
