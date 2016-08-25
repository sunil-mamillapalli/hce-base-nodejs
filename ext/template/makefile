ifndef $(DOCKER_HUB_USER)
  DOCKER_HUB_USER ?= helioncf
endif
DOCKER_IMAGE_TAG := $(DOCKER_HUB_USER)/$(DOCKER_HUB_NAME)

TEST_APP_BRANCH ?= master
TEST_APP_URL := git@github.com:$(TEST_APP)
TEST_APP_PATH := app

BUILD_INPUT_PATH := src/app
BUILD_OUTPUT_PATH := src/build
TEST_INPUT_PATH := src/build
TEST_OUTPUT_PATH := src/test
BUILD_COMMAND:= /src/bin/build.sh \
    /$(BUILD_INPUT_PATH) \
    /$(BUILD_OUTPUT_PATH)

TEST_COMMAND := /src/bin/test.sh \
    /$(TEST_INPUT_PATH) \
    /$(TEST_OUTPUT_PATH)

DOCKER_RUN_COMMAND := \
    docker run -it \
    -v $(PWD)/bin:/src/bin \
    -v $(PWD)/lib:/src/lib \
    -v $(PWD)/$(TEST_APP_PATH):/$(BUILD_INPUT_PATH) \
    -v $(PWD)/build:/$(BUILD_OUTPUT_PATH) \
    -v $(PWD)/test:/$(TEST_OUTPUT_PATH) \
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
	$(DOCKER_RUN_COMMAND) $(BUILD_COMMAND)
	$(DOCKER_RUN_COMMAND) $(TEST_COMMAND)

push: build
	docker push $(DOCKER_IMAGE_TAG)

shell: build
	$(DOCKER_RUN_COMMAND) bash

clean:
	git clean -dxf
	rm -rf app build buildpack

buildpack:
	git clone --depth=1 --recursive --branch=$(BUILDPACK_TAG) $(BUILDPACK_URL) $@

$(TEST_APP_PATH):
	git clone --depth=1 --recursive --branch=$(TEST_APP_BRANCH) $(TEST_APP_URL) $@
