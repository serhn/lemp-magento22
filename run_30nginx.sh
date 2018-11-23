#!/bin/sh
CONTAINER="nginx_mag"
. inc/init.sh
IMAGE="nginx:1.15.6"
docker run -it -d \
	--restart unless-stopped \
	--link php_mag \
	--name="$CONTAINER" \
	-e TZ="$TZ" \
        -v ${PWD}/mag:/usr/share/nginx \
        -v ${PWD}/inc/nginx.conf:/etc/nginx/conf.d/default.conf \
        -v ${PWD}/inc/nginx.inc.conf:/etc/nginx/nginx.inc.conf \
        -v ${PWD}/log/nginx:/var/log/nginx \
	-p 81:80 $IMAGE
