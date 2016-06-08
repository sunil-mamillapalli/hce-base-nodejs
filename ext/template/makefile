ifndef $(DOCKER_HUB_USER)
  DOCKER_HUB_USER ?= helioncf
endif
DOCKER_IMAGE_TAG := $(DOCKER_HUB_USER)/$(DOCKER_HUB_NAME)

TEST_APP_URL := git@github.com:$(TEST_APP)
TEST_APP_PATH := app

TEST_INPUT_PATH := src/app
TEST_OUTPUT_PATH := src/out
TEST_COMMAND := /src/bin/make-test.sh \
    /$(TEST_INPUT_PATH) \
    /$(TEST_OUTPUT_PATH)

DOCKER_RUN_COMMAND := \
    docker run -it \
    -v $(PWD)/bin:/src/bin \
    -v $(PWD)/lib:/src/lib \
    -v $(PWD)/$(TEST_APP_PATH):/$(TEST_INPUT_PATH) \
    -v $(PWD)/out:/$(TEST_OUTPUT_PATH) \
    $(DOCKER_IMAGE_TAG)

.PHONY: test

default: help

help:
	@echo "These 'make' targets are available."
	@echo
	@echo "  build - Build the Docker image"
	@echo "  test  - Run the Maven tests"
	@echo "  push  - Push the Docker image"
	@echo "  shell - Shell into a Docker container"
	@echo "  clean - Remove generated content"
	@echo

build: buildpack
	docker build -t $(DOCKER_IMAGE_TAG) .

test: build $(TEST_APP_PATH)
	mkdir -p out
	$(DOCKER_RUN_COMMAND) $(TEST_COMMAND)

push: build
	docker push $(DOCKER_IMAGE_TAG)

shell: build
	$(DOCKER_RUN_COMMAND) bash

clean:
	rm -f .gitignore .makefile bin/make-test.sh
	rm -fr app buildpack concourse lib out

buildpack:
	git clone --recursive $(BUILDPACK_URL) $@

$(TEST_APP_PATH):
	git clone --recursive $(TEST_APP_URL) $@
