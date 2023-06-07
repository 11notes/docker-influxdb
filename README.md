# Alpine :: InfluxDB
Run InfluxDB based on Alpine Linux. Small, lightweight, secure and fast 🏔️

## Run
```shell
docker run --name influxdb \
  -v .../etc:/influxdb/etc \
  -v .../var:/influxdb/var \
  -d 11notes/influxdb:[tag]
```

## Defaults
| Parameter | Value | Description |
| --- | --- | --- |
| `user` | docker | user docker |
| `uid` | 1000 | user id 1000 |
| `gid` | 1000 | group id 1000 |

## Parent
* [influxdb:2.7-alpine](https://github.com/influxdata/influxdata-docker/tree/master/influxdb/2.7/alpine)

## Built with
* [influxdb](https://github.com/influxdata/influxdb)
* [Alpine Linux](https://alpinelinux.org/)

## Tips
* Don't bind to ports < 1024 (requires root), use NAT/reverse proxy
* [Permanent Stroage](https://github.com/11notes/alpine-docker-netshare) - Module to store permanent container data via NFS/CIFS and more