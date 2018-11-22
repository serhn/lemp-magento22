#!/bin/sh
CONTAINER="nginx_mag"
. inc/init.sh
IMAGE="nginx:1.15.6"
docker run -it -d \
	--restart unless-stopped \
	--link php_mag \
	--name="$CONTAINER" \
	-e TZ="$TZ" \
        -v ${PROJECT_DIR}:/usr/share/nginx \
        -v ${PWD}/inc/nginx.conf:/etc/nginx/conf.d/default.conf \
        -v ${PWD}/inc/nginx.conf.inc:/etc/nginx/nginx.conf.inc \
        -v ${PWD}/log/nginx:/var/log/nginx \
	-p 81:80 $IMAGE
