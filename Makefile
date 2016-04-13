GIT_SUBMODULE_EACH = git submodule foreach

# Docker command wrappers
.PHONY: docker-tag
docker-tag:
	$(GIT_SUBMODULE_EACH) "$$(cat gitscripts/docker-tag)"

.PHONY: docker-push
docker-push:
	$(GIT_SUBMODULE_EACH) "$$(cat gitscripts/docker-push)"

# Git command wrappers
.PHONY: git-update
git-update: git-clean
	git submodule update --init --recursive --remote -f

.PHONY: git-tag
git-tag:
	$(GIT_SUBMODULE_EACH) "$$(cat gitscripts/tag-git)"

.PHONY: git-tag-delete
git-tag-delete:
	$(GIT_SUBMODULE_EACH) "$$(cat gitscripts/tag-delete)"

.PHONY: git-tag-push
git-tag-push:
	$(GIT_SUBMODULE_EACH) "git push --tags"

.PHONY: git-commit
git-commit:
	$(GIT_SUBMODULE_EACH) "git commit -a || true"

.PHONY: git-diff
git-diff:
	$(GIT_SUBMODULE_EACH) "git diff HEAD"

.PHONY: git-push
git-push:
	$(GIT_SUBMODULE_EACH) "git push"

.PHONY: git-clean
git-clean:
	git submodule foreach "git clean -fdx"

.PHONY: git-checkout
git-checkout: git-clean
	git submodule update --init --checkout --recursive -f
