ARG ASUS_NVIDIA="${ASUS_NVIDIA:-bazzite-asus-nvidia}"
ARG RELEASE_TAG="${RELEASE_TAG:-stable}"

FROM ghcr.io/ublue-os/${ASUS_NVIDIA}:${RELEASE_TAG} as silverquinn

COPY system /
COPY config /config

RUN /config/preconfig.sh && \
    /config/shell/install.sh && \
    /config/tmux/install.sh && \
    /config/git/install.sh && \
    /config/neovim/install.sh && \
    /config/desktop/install.sh && \
    /config/cleanup.sh && \
    ostree container commit