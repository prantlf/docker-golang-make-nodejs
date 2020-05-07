# prantlf/golang-make-nodejs

[Docker] image: Go language on Alpine Linux with Make and Node.js

[![prantlf/golang-make-nodejs](http://dockeri.co/image/prantlf/golang-make-nodejs)](https://hub.docker.com/repository/docker/prantlf/golang-make-nodejs/)

[This image] is supposed to build and test web browser applications written in [Go]. Back-end often uses `make` as a build tool, which is added by this image. Front-end often contains static assets distributed by [NPM] and bundled using build tools running in [Node.js].  This image is built automatically on the top of the tag [`alpine`] from the [golang repository], so that it always runs the current version of [Go] in the latest [Alpine Linux]. [Make], [Node.js] and [NPM] have to be updated from time to time by triggering a new build manually.

## Tags

- [`latest`]

## Install

```
docker pull prantlf/golang-make-nodejs
# or
docker pull prantlf/golang-make-nodejs:latest
```

## Use

Just like the image from the [golang repository]. You will be able to call `make` in addition to `go`.

## Build, Test and Publish

The local image is built as `golang-make-nodejs` and pushed to the docker hub as `prantlf/golang-make-nodejs:latest`.

Remove an old local image:

    make clean

Check the `Dockerfile`:

    make lint

Build a new local image:

    make build

Enter an interactive shell inside the created image:

    make run

Tag the local image for pushing:

    make tag

Login to the docker hub:

    make login

Push the local image to the docker hub:

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
