# :: Header
  FROM influxdb:2.7-alpine

# :: Run
  USER root

  # :: update image
    RUN set -ex; \
      apk --update --no-cache add \
        curl \
        tzdata \
        shadow; \
      apk update; \
      apk upgrade;

  # :: prepare image
    RUN set -ex; \
      mkdir -p /influxdb; \
      ln -s /etc/influxdb2 /influxdb/etc; \
      ln -s /var/lib/influxdb2 /influxdb/var; \
      mv /entrypoint.sh /usr/local/bin;

  # :: copy root filesystem changes and add execution rights to init scripts
    COPY ./rootfs /
    RUN set -ex; \
      chmod +x -R /usr/local/bin;

  # :: change home path for existing user and set correct permission
    RUN set -ex; \
      usermod -l docker influxdb; \
      groupmod -n docker influxdb; \
      usermod -d /influxdb docker; \
      chown -R 1000:1000 \
        /influxdb \
        /etc/influxdb2 \
        /var/lib/influxdb2;

# :: Volumes
  VOLUME ["/influxdb/etc", "/influxdb/var"]

# :: Monitor
  HEALTHCHECK CMD /usr/local/bin/healthcheck.sh || exit 1

# :: Start
	USER docker
  ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]