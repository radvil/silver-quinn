# Using Bazzite variants as base images
# renovate: datasource=github-releases depName=ublue-os/bazzite

# Default to bazzite-asus-nvidia if not specified
ARG BASE_IMAGE="${BASE_IMAGE:-bazzite-asus-nvidia}"
ARG RELEASE_TAG="${RELEASE_TAG:-stable}"

FROM ghcr.io/ublue-os/${BASE_IMAGE}:${RELEASE_TAG} as silverquinn

# Set environment variables for build scripts to detect variants
ARG BASE_IMAGE
ENV BASE_IMAGE=${BASE_IMAGE} \
    IS_GNOME_VARIANT=0 \
    IS_OPEN_DRIVER=0

# Set variant flags based on base image name
RUN if [[ "${BASE_IMAGE}" == *"gnome"* ]]; then \
      echo "Setting GNOME variant flag" && \
      echo "IS_GNOME_VARIANT=1" >> /etc/environment && \
      sed -i 's/^ENV IS_GNOME_VARIANT=.*/ENV IS_GNOME_VARIANT=1/' /Containerfile; \
    fi && \
    if [[ "${BASE_IMAGE}" == *"-open"* ]]; then \
      echo "Setting open driver flag" && \
      echo "IS_OPEN_DRIVER=1" >> /etc/environment && \
      sed -i 's/^ENV IS_OPEN_DRIVER=.*/ENV IS_OPEN_DRIVER=1/' /Containerfile; \
    fi

COPY system /
COPY installers /installers
COPY build.sh /tmp/build.sh

RUN /tmp/build.sh
