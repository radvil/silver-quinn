# Using either bazzite-asus-nvidia or bazzite-gnome-asus-nvidia as base image
# renovate: datasource=github-releases depName=ublue-os/bazzite

# Default to bazzite-asus-nvidia if not specified
# To use GNOME variant, set BASE_IMAGE=bazzite-gnome-asus-nvidia
ARG BASE_IMAGE="${BASE_IMAGE:-bazzite-asus-nvidia}"
ARG RELEASE_TAG="${RELEASE_TAG:-stable}"

FROM ghcr.io/ublue-os/${BASE_IMAGE}:${RELEASE_TAG} as silverquinn

# Set environment variable for build scripts to detect GNOME variant
ENV IS_GNOME_VARIANT=0
ENV IS_GNOME_VARIANT=${BASE_IMAGE:+${BASE_IMAGE#*bazzite-gnome}}

COPY system /
COPY installers /installers
COPY build.sh /tmp/build.sh

RUN /tmp/build.sh
