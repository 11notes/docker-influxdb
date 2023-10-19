# Alpine :: InfluxDB
![size](https://img.shields.io/docker/image-size/11notes/influxdb/2.7.3?color=0eb305) ![version](https://img.shields.io/docker/v/11notes/influxdb?color=eb7a09) ![pulls](https://img.shields.io/docker/pulls/11notes/influxdb?color=2b75d6) ![activity](https://img.shields.io/github/commit-activity/m/11notes/docker-influxdb?color=c91cb8) ![commit-last](https://img.shields.io/github/last-commit/11notes/docker-influxdb?color=c91cb8)

Run InfluxDB based on Alpine Linux. Small, lightweight, secure and fast 🏔️

## Volumes
* **/influxdb/etc** - Directory of config.yml
* **/influxdb/var** - Directory of all mutable data

## Run
```shell
docker run --name influxdb \
  -p 8086:8086 \
  -v .../etc/config.yml:/influxdb/etc/config.yml \
  -v .../var:/influxdb/var \
  -d 11notes/influxdb:[tag]
```

```shell
docker run --name influxdb \
  -p 8086:8086 \
  -v .../etc/config.yml:/influxdb/etc/config.yml \
  -v .../var:/influxdb/var \
  -e DOCKER_INFLUXDB_INIT_MODE=setup \
  -e DOCKER_INFLUXDB_INIT_USERNAME=admin \
  -e DOCKER_INFLUXDB_INIT_PASSWORD=**************** \
  -e DOCKER_INFLUXDB_INIT_ORG=DOCKER \
  -e DOCKER_INFLUXDB_INIT_BUCKET=test \
  -e DOCKER_INFLUXDB_INIT_RETENTION=24h \
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
| `ssl` | /influxdb/ssl | SSL is enabled by default |

## Access
| Parameter | Value | Description |
| --- | --- | --- |
| `web` | https://${IP}:8086 | default web ui |

## Parent Image
* [influxdb:2.7.3-alpine](https://github.com/influxdata/influxdata-docker/blob/d141bf4a31102263b69128166c5b22496cac0c64/influxdb/2.7/alpine/Dockerfile)

## Built with and thanks to
* [influxdb](https://github.com/influxdata/influxdb)
* [Alpine Linux](https://alpinelinux.org/)

## Tips
* Use reverse proxy for valid SSL certificates or add your certificates to /influxdb/ssl
* Only use rootless container runtime (podman, rootless docker)
* Don't bind to ports < 1024 (requires root), use NAT/reverse proxy (haproxy, traefik, nginx)