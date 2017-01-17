CI_BUILD_NUMBER ?= $(USER)-snapshot

PUBLISH_TAG = mup.cr/docker-gcsfuse:$(CI_BUILD_NUMBER)

# Build the image.
package:
	docker build -t $(PUBLISH_TAG) .

package-test:
	@echo "No package tests yet for $(PUBLISH_TAG)"

# Push the image to the docker registry/repository.
publish: package
	@docker push $(PUBLISH_TAG)

publish-tag:
	@echo $(PUBLISH_TAG)
