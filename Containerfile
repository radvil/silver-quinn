# Using bazzite-gnome-asus-nvidia as base image
# renovate: datasource=github-releases depName=ublue-os/bazzite
ARG GNOME_ASUS_NVIDIA="${GNOME_ASUS_NVIDIA:-bazzite-gnome-asus-nvidia}"
ARG RELEASE_TAG="${RELEASE_TAG:-stable}"

FROM ghcr.io/ublue-os/${GNOME_ASUS_NVIDIA}:${RELEASE_TAG} as silverquinn

COPY system /
COPY installers /installers
COPY build.sh /tmp/build.sh

RUN /tmp/build.sh
