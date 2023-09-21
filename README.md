# Alpine :: InfluxDB
![size](https://img.shields.io/docker/image-size/11notes/influxdb/2.7.1?color=0eb305) ![version](https://img.shields.io/docker/v/11notes/influxdb?color=eb7a09) ![pulls](https://img.shields.io/docker/pulls/11notes/influxdb?color=2b75d6) ![activity](https://img.shields.io/github/commit-activity/m/11notes/docker-influxdb?color=c91cb8) ![commit-last](https://img.shields.io/github/last-commit/11notes/docker-influxdb?color=c91cb8)

Run InfluxDB based on Alpine Linux. Small, lightweight, secure and fast 🏔️

## Volumes
* **/influxdb/etc** - Directory of config.yml
* **/influxdb/var** - Directory of all mutable data

## Run
```shell
docker run --name influxdb \
  -v .../etc/config.yml:/influxdb/etc/config.yml \
  -v .../var:/influxdb/var \
  -d 11notes/influxdb:[tag]
```

## Defaults
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | user docker |
| `uid` | 1000 | user id 1000 |
| `gid` | 1000 | group id 1000 |
| `home` | /influxdb | home directory of user docker |
| `web` | https://${IP}:8086 | default web ui |
| `config` | /influxdb/etc/config.yml | default config location |

## Parent
* [influxdb:2.7.1-alpine](https://github.com/influxdata/influxdata-docker/blob/46221770aa619e97553bc95443954f6c4690e1ce/influxdb/2.7/alpine/Dockerfile)

## Built with
* [influxdb](https://github.com/influxdata/influxdb)
* [Alpine Linux](https://alpinelinux.org/)

## Tips
* Only use rootless container runtime (podman, rootless docker)
* Don't bind to ports < 1024 (requires root), use NAT/reverse proxy (haproxy, traefik, nginx)