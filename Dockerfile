FROM docker.io/archlinux:latest

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
# 3. /media must be present (toolbox tries to remove the folder and create a symlink)
RUN touch /etc/machine-id && \
  echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/toolbox && \
  mkdir /media

# Toolbox doesn't set correctly $PROMPT_COMMAND
# This step unset the variable if it's composed only by white spaces
RUN sed -i '/PS1/a \\n# Clean \$PROMPT_COMMAND not correctly set by Toolbox\n\[\[ \-z \"\$\{PROMPT_COMMAND// \}\" \]\] && unset PROMPT_COMMAND' /etc/bash.bashrc

CMD /bin/bash
