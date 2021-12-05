define rm_image
	docker image rm golang-make-nodejs:$(1)
endef

define pull_image
	docker pull prantlf/golang-make:$(1)
endef

define lint_dockerfile
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< $(1)
endef

define build_image
	docker build -f $(1) -t golang-make-nodejs .
	docker tag golang-make-nodejs golang-make-nodejs:$(2)
endef

define test_container
	docker run --rm -v "${PWD}":/work -w /work golang-make-nodejs:$(1) echo VERSION=$(1)
	docker run --rm --entrypoint=node golang-make-nodejs:$(1) -e "console.log('node $(1) works')"
endef

define tag_image
	docker tag golang-make-nodejs:$(1) prantlf/golang-make-nodejs:$(1)
endef

define push_image
	docker push prantlf/golang-make-nodejs:$(1)
endef

ifeq ($(VERSION),)
	VERSION=1.17
endif

clean ::
	$(call rm_image,1.17)

pull ::
	$(call pull_image,1.17)

lint ::
	$(call lint_dockerfile,Dockerfile)

build ::
	$(call build_image,Dockerfile,1.17)

test ::
	$(call test_container,1.17)

tag ::
	$(call tag_image,1.17)

echo ::
	@echo "go $(VERSION) works"

shell ::
	docker run --rm -it --entrypoint=busybox golang-make-nodejs:$(VERSION) sh

run ::
	docker run --rm -it -v "${PWD}":/work -w /work golang-make-nodejs:$(VERSION)

login ::
	docker login --username=prantlf

push ::
	$(call push_image,1.17)
