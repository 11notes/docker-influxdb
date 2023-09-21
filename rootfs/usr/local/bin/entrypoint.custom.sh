#!/bin/ash

  if [ ! -f "${APP_ROOT}/ssl/cert.pem" ]; then
    openssl req -x509 -newkey rsa:4096 -subj "/C=XX/ST=XX/L=XX/O=XX/OU=XX/CN=XX" \
      -keyout "${APP_ROOT}/ssl/key.pem" \
      -out "${APP_ROOT}/ssl/cert.pem" \
      -days 3650 -nodes -sha256 &> /dev/null
  fi

  sed -i s#INFLUXD_TLS_CERT='' INFLUXD_TLS_KEY=''## /usr/local/bin/entrypoint.sh
  /usr/local/bin/entrypoint.sh