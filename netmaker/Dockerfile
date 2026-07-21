ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:21.0.0
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
ARG BUILD_ARCH=amd64
ARG NETCLIENT_VERSION="v1.6.0"
# hadolint ignore=DL3018
RUN \
    apk add --no-cache \
        iproute2 \
        iptables \
        ip6tables \
        nftables \
        wireguard-tools \
        openresolv \
        coreutils \
    \
    && ln -sf /sbin/xtables-nft-multi /sbin/ip6tables \
    && ln -sf /sbin/xtables-nft-multi /sbin/iptables \
    \
    && if [ "${BUILD_ARCH}" = "aarch64" ]; then NETCLIENT_ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then NETCLIENT_ARCH="amd64"; fi \
    \
    && curl -J -L -s -o /opt/netclient \
        "https://github.com/gravitl/netclient/releases/download/${NETCLIENT_VERSION}/netclient-linux-${NETCLIENT_ARCH}" \
    && chmod 0755 /opt/netclient \
    && ln -sf /opt/netclient /usr/bin/netclient

# Copy root filesystem
COPY rootfs /

HEALTHCHECK \
    CMD healthcheck

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="SavantCoder <github@savant.io>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Savant Home Assistant Add-ons" \
    org.opencontainers.image.authors="SavantCoder <github@savant.io>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
