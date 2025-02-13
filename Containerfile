# Using bazzite-asus-nvidia as base image
# renovate: datasource=github-releases depName=ublue-os/bazzite
ARG ASUS_NVIDIA="${ASUS_NVIDIA:-bazzite-asus-nvidia-open}"
ARG RELEASE_TAG="${RELEASE_TAG:-stable}"

FROM ghcr.io/ublue-os/${ASUS_NVIDIA}:${RELEASE_TAG} as silverquinn

COPY system /
COPY installers /installers
COPY build.sh /tmp/build.sh

RUN /tmp/build.sh
