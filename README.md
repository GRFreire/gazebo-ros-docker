# How to run Gazebo GUI from within docker

## 0. Prerequisits

1. Docker
2. Linux
3. X11 - though wayland may be possible using xwayland

## 1. nvidia container-toolkit

1. Install the [container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
and configure the container runtime.

## 2. Run docker image

```sh
docker compose build
docker compose run gazebo-ros
```
