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
	$(GIT_SUBMODULE_EACH) "$$(cat gitscripts/set-versions)"
	atom workflow/rootfs/scheduler/k8s.py \
		builder/rootfs/etc/deis-dockerbuilder.yaml \
		builder/rootfs/etc/deis-slugbuilder.yaml \
		minio/manifests/deis-mc-integration-pod.yaml \
		minio/manifests/deis-mc-pod.yaml \
		minio/manifests/deis-minio-rc.yaml \
		workflow/manifests/deis-workflow-rc.yml
	@echo "Run 'ack' to verify that no previous versions exist"

.PHONY: commit
commit:
	$(GIT_SUBMODULE_EACH) "git commit -a"

.PHONY: diff
diff:
	$(GIT_SUBMODULE_EACH) "git diff HEAD"

.PHONY: push
push:
	$(GIT_SUBMODULE_EACH) "git push"
