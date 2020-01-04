# Archlinux Toolbox

Archlinux toolbox that can be used with [Toolbox](https://github.com/containers/toolbox).
An automated build is available in the Docker Hub as `docker.io/palazzem/archlinux-toolbox:latest`.

## Usage

From a system that has `toolbox` installed, run:

```bash
$ toolbox create -i docker.io/palazzem/archlinux-toolbox:latest -c archlinux-toolbox
$ toolbox enter -c archlinux-toolbox

# You should see this but with your username:
# [palazzem@toolbox ~]$
```

This image has been introduced as an [iteration of an official PR](https://github.com/palazzem/archlinux-toolbox/pull/1).
