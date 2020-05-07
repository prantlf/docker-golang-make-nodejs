clean ::
	docker image rm golang-make-nodejs

lint ::
	docker run --rm -i \
		-v ${PWD}/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t golang-make-nodejs .

run ::
	docker run --rm -t -i golang-make-nodejs busybox sh

tag ::
	docker tag golang-make-nodejs prantlf/golang-make-nodejs:latest

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/golang-make-nodejs:latest
