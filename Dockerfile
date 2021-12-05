FROM prantlf/golang-make:1.17
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

RUN apk add --no-cache nodejs npm
