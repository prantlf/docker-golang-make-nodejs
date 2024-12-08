define rm_image
	docker image rm golang-make-nodejs:$(1) prantlf/golang-make-nodejs:$(1) registry.gitlab.com/prantlf/docker-golang-make-nodejs:$(1)
endef

define pull_image
	docker pull prantlf/golang-make-nodejs:$(1)
	docker pull registry.gitlab.com/prantlf/docker-golang-make-nodejs:$(1)
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
	docker tag golang-make-nodejs prantlf/golang-make-nodejs
	docker tag golang-make-nodejs prantlf/golang-make-nodejs:$(2)
endef

define test_container
	docker run --rm -v "${PWD}":/work -w /work golang-make-nodejs:$(1) echo VERSION=$(1)
	docker run --rm --entrypoint=node golang-make-nodejs:$(1) -e "console.log('node $(1) works')"
endef

define push_image
	docker tag prantlf/golang-make-nodejs prantlf/golang-make-nodejs:$(1)
	docker push prantlf/golang-make-nodejs:$(1)
	docker tag registry.gitlab.com/prantlf/docker-golang-make-nodejs registry.gitlab.com/prantlf/docker-golang-make-nodejs:$(1)
	docker push registry.gitlab.com/prantlf/docker-golang-make-nodejs:$(1)
endef

ifeq ($(VERSION),)
	VERSION=latest
endif

all :: lint build

clean ::
	$(call rm_image,latest)

pull ::
	$(call pull_image,latest)

lint ::
	$(call lint_dockerfile,Dockerfile)

build ::
	$(call build_image,Dockerfile,latest)

test ::
	$(call test_container,latest)

echo ::
	@echo "go $(VERSION) works"

shell ::
	docker run --rm -it --entrypoint=busybox golang-make-nodejs:$(VERSION) sh

run ::
	docker run --rm -it -v "${PWD}":/work -w /work golang-make-nodejs:$(VERSION)

login ::
	docker login --username=prantlf
	docker login registry.gitlab.com --username=prantlf

push ::
	$(call push_image,$(VERSION))
