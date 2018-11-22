#!/bin/sh
. inc/init.sh
IMAGE="nginx:1.15.6"
docker run -it -d \
	--restart unless-stopped \
	--link php71 \
	--name="$CONTAINER" \
	-e TZ="$TZ" \
        -v ${PROJECT_DIR}:/usr/share/nginx \
        -v ${PWD}/inc/nginx.conf:/etc/nginx/conf.d/default.conf \
        -v ${PWD}/log/nginx:/var/log/nginx \
	-p 80:80 $IMAGE
