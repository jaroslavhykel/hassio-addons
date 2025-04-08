ARG BUILD_FROM

FROM $BUILD_FROM

# environment settings
ARG TZ="Etc/UTC"

ENV HOME="/config"
ENV container="DOCKER"

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# oneplay version v1.1.5
RUN \
  # Install script.o2tv.server
  apk upgrade --no-cache \
  && apk add --no-cache py3-bottle \
  py3-websocket-client \
  && apk add --no-cache --virtual .build-deps \
  git \
  && mkdir -p /usr/local/lib/ \
  && cd /usr/local/lib \
  && git clone https://github.com/waladir/script.oneplay.server.git \
  && cd script.oneplay.server \
  && rm -r scripts \
  && rm -r .git \
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
