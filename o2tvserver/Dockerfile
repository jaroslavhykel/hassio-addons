ARG BUILD_FROM

FROM $BUILD_FROM

# environment settings
ARG TZ="Etc/UTC"

ENV HOME="/config"

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

RUN \
  # Install script.o2tv.server
  apk upgrade --no-cache \
  && apk add --no-cache py3-bottle \
  && apk add --no-cache --virtual .build-deps \
  zip \
  wget \
  && mkdir -p /usr/local/lib/ \
  && cd /usr/local/lib \
  && wget https://github.com/waladir/script.o2tv.server/archive/refs/heads/master.zip \
  && unzip master.zip \
  && rm master.zip \
  && cd script.o2tv.server-master \
  && cp config.txt.sample config.txt \
  && chmod +x server.py \
  && apk del --no-cache --purge .build-deps

  # Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_NAME
ARG BUILD_DESCRIPTION
ARG BUILD_ARCH
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Jaroslav Hykel"
