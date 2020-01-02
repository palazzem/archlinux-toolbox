FROM docker.io/archlinux/base:latest

ENV NAME=arch-toolbox VERSION=rolling
LABEL com.github.containers.toolbox="true" \
      com.github.debarshiray.toolbox="true" \
      name="$FCG/$NAME" \
      version="$VERSION" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Base image for creating Arch toolbox containers" \
      maintainer="Emanuele Palazzetti <emanuele.palazzetti@gmail.com>"

# Install packages from the extra-packages file
# and complete the clean up of local caches
COPY extra-packages /
RUN pacman -Syu --noconfirm && \
  pacman -Sy --noconfirm $(<extra-packages) && \
  rm /extra-packages && \
  pacman -Scc --noconfirm

CMD /bin/bash
