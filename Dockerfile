FROM python:3.8-alpine3.11
ARG REQUIREMENTS

COPY requirements /tmp


RUN apk add --no-cache --virtual .build-deps \
       postgresql-dev \
       musl-dev \
   && apk add --no-cache \
        postgresql-client \
        libffi-dev \
        bash \
        zlib-dev \
        gcc \
        jpeg-dev \
        gettext \
        linux-headers \
        dbus git \
    && apk add --no-cache  \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
        geos-dev \
        gdal-dev proj proj-dev \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir -r requirements/$REQUIREMENTS


ADD . /code
WORKDIR /code

