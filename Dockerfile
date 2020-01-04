FROM docker.io/archlinux/base:latest

ENV NAME=arch-toolbox VERSION=rolling
LABEL com.github.containers.toolbox="true" \
      com.github.debarshiray.toolbox="true" \
      name="$NAME" \
      version="$VERSION" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Base image for creating Arch toolbox containers" \
      maintainer="Emanuele Palazzetti <emanuele.palazzetti@gmail.com>"

# Install required dependencies to run `toolbox`
RUN pacman -Sy sudo git --noconfirm && \
  pacman -Scc --noconfirm

# Required steps otherwise `toolbox` fails to start the container:
# 1. machine-id must be present in the base image
# 2. $(whoami) must be in the sudoer list without password
RUN touch /etc/machine-id
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/toolbox

CMD /bin/bash
