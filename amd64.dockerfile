# :: Header
  FROM influxdb:2.7.3-alpine
  ENV APP_ROOT=/influxdb

# :: Run
  USER root

  # :: update image
    RUN set -ex; \
      apk --no-cache add \
        curl \
        tzdata \
        shadow \
        openssl; \
      apk --no-cache upgrade;

  # :: prepare image
    RUN set -ex; \
      mkdir -p ${APP_ROOT}; \
      mkdir -p ${APP_ROOT}/etc; \
      mkdir -p ${APP_ROOT}/var; \
      mkdir -p ${APP_ROOT}/ssl; \
      rm -f /etc/defaults/influxdb2/config.yml; \
      ln -s ${APP_ROOT}/etc/config.yml /etc/defaults/influxdb2/config.yml; \
      mv /entrypoint.sh /usr/local/bin;

  # :: copy root filesystem changes and add execution rights to init scripts
    COPY ./rootfs /
    RUN set -ex; \
      chmod +x -R /usr/local/bin;

  # :: change home path for existing user and set correct permission
    RUN set -ex; \
      usermod -l docker influxdb; \
      groupmod -n docker influxdb; \
      usermod -d ${APP_ROOT} docker; \
      chown -R 1000:1000 \
        ${APP_ROOT} \
        /etc/influxdb2 \
        /var/lib/influxdb2 \
        /etc/defaults/influxdb2;

# :: Volumes
  VOLUME ["${APP_ROOT}/var"]

# :: Monitor
  HEALTHCHECK CMD /usr/local/bin/healthcheck.sh || exit 1

# :: Start
	USER docker
  ENTRYPOINT ["/usr/local/bin/entrypoint.custom.sh"]