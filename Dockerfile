FROM python:3.6.2-alpine3.6
ARG REQUIREMENTS
RUN apk update
RUN apk add --no-cache \
        postgresql-dev \
        postgresql-client \
        libffi-dev \
        gcc \
        bash \
        zlib-dev \
        jpeg-dev \
        gettext \
        linux-headers

RUN apk add musl-dev
RUN apk add --no-cache --virtual .build-deps-testing \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        gdal-dev \
        geos-dev \
        proj4-dev

RUN mkdir /code
ADD requirements /code/requirements/
WORKDIR /code
RUN pip3.6 install -r requirements/$REQUIREMENTS

