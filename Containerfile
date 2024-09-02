FROM docker.io/library/ubuntu:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="Development container" \
      maintainer="lenusiwalker@outlook.com"

COPY extra-packages /
RUN apt update && \
    apt upgrade -y && \
    grep -v '^#' /extra-packages | xargs apt install -y
RUN rm /extra-packages

COPY repo-packages.sh /
RUN chmod u+x repo-packages.sh && \
    ./repo-packages.sh 
RUN rm /repo-packages.sh

RUN   ln -fs /bin/sh /usr/bin/sh && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update
     