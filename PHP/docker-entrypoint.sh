#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

chown -R :www-data /var/www
chmod -R 770 /var/www
chmod g+s /var/www
find /var/www -type f -exec chmod 660 {} \;
find /var/www -type d -exec chmod g+s {} \;

exec "$@"