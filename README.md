# prantlf/golang-make-nodejs

[Docker] image: Go language on Alpine Linux with Make and Node.js

[![prantlf/golang-make-nodejs](http://dockeri.co/image/prantlf/golang-make-nodejs)](https://hub.docker.com/repository/docker/prantlf/golang-make-nodejs/)

[This image] is supposed to build and test web browser applications written in [Go]. Back-end often uses `make` as a build tool, which is added by this image. Front-end often contains static assets distributed by [NPM] and bundled using build tools running in [Node.js].  This image is built automatically on the top of the tag [`alpine`] from the [golang repository], so that it always runs the current version of [Go] in the latest [Alpine Linux]. [Make], [Node.js] and [NPM] have to be updated from time to time by triggering a new build manually.

## Tags

- [`latest`]  (`1.15-lts`)
- `lts` (`1.15-lts`), `current` (`1.15-current`)
- `1.15-lts`, `1.15-current`
- `1.14-lts`, `1.14-current`

## Install

    docker pull prantlf/golang-make-nodejs
    # or a specific tag
    docker pull prantlf/golang-make-nodejs:1.15-lts

## Use

Just like the image from the [golang repository]. You will be able to call `make`, `node` and `npm` in addition to `go`. You can either create your own image based on this one, or you can use it directly to build a Go project. For example, build from sources in the current directory, where you have the `Makefile`:

    docker run --rm -it -v "${PWD}":/work -w /work \
      prantlf/golang-make-nodejs clean all

If you need to install some global dependencies, which `go build` does not du automatically, or if you need to execute `go generate`, or if you need to install NPM dependencies by running `npm ci`, you can introduce a special target `prepare` for these steps and insert it between `clean` and `all` to the command line, for example.

## Build, Test and Publish

The local images are built as `golang-make-nodejs` with the appropriate tags and pushed to the docker hub as `prantlf/golang-make-nodejs` with the same tags.

    # remove the old local images
    make clean
    # Check the syntax of the Dockerfiles
    make lint
    # update the local parent images
    make pull
    # build new local images and tag them
    make build
    # test the local images
    make test
    # enter an interactive shell inside a local image
    make shell VERSION=latest
    # run make using the created image
    make run VERSION=latest
    # tag the local images tor upload
    make tag
    # login to the docker hub
    make login
    # push the local images to the docker hub
    make push

## License

Copyright (c) 2020 Ferdinand Prantl

Licensed under the MIT license.

[Docker]: https://www.docker.com/
[This image]: https://hub.docker.com/repository/docker/prantlf/golang-make-nodejs
[`alpine`]: https://hub.docker.com/_/golang?tab=tags
[`latest`]: https://hub.docker.com/repository/docker/prantlf/golang-make-nodejs/tags
[Go]: https://golang.org/
[golang repository]: https://hub.docker.com/_/golang
[Make]: https://www.gnu.org/software/make/
[Node.js]: https://nodejs.org/
[NPM]: https://docs.npmjs.com/cli/npm
[Alpine Linux]: https://alpinelinux.org/
