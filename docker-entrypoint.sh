#!/bin/sh

sed -i -E "s/(<source src=\").+(.m3u8\")/\1$2\2/" /var/www/localhost/htdocs/index.html

lighttpd -f /etc/lighttpd/lighttpd.conf

set -- live555HLSProxy "$@"

exec "$@"
