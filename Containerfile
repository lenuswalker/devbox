# FROM docker.io/library/ubuntu:latest
FROM ghcr.io/ublue-os/ubuntu-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="Development container" \
      maintainer="lenusiwalker@outlook.com"

COPY extra-packages /
RUN apt update && \
    apt upgrade -y && \
    grep -v '^#' /extra-packages | xargs apt install -y
RUN rm /extra-packages

RUN mkdir /opt/scripts

COPY non-repo-packages.sh /opt/scripts/
RUN chmod +x /opt/scripts/non-repo-packages.sh && \
    /opt/scripts/non-repo-packages.sh && \
    rm /opt/scripts/non-repo-packages.sh

COPY dotfile-setup.sh /opt/scripts/
RUN chmod +x /opt/scripts/dotfile-setup.sh

# RUN   ln -fs /bin/sh /usr/bin/sh && \
#       ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
#       ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
#       ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
#       ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
#       ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update
     