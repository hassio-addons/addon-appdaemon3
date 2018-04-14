ARG BUILD_FROM=hassioaddons/base-amd64:1.3.3
FROM ${BUILD_FROM}

# Setup base
RUN \
    apk add --no-cache --virtual .build-dependencies \
        gcc \
        libc-dev \
        libffi-dev \
        python3-dev \
    \
    && apk add --no-cache \
        python3 \
    \
    && pip3 install \
        appdaemon==3.0.1 \
        yq \
    \
    && apk del --purge .build-dependencies

# Copy root filesystem
COPY rootfs /

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="AppDaemon3" \
    io.hass.description="Python Apps and HADashboard using AppDaemon 3.x for Home Assistant" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Franck Nijhof <frenck@addons.community>" \
    org.label-schema.description="Python Apps and HADashboard using AppDaemon 3.x for Home Assistant" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="AppDaemon3" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://community.home-assistant.io/t/community-hass-io-add-on-appdaemon3/41261?u=frenck" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-appdaemon3/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-appdaemon3" \
    org.label-schema.vendor="Community Hass.io Add-ons"
