#!/bin/sh
CONTAINER="php_mag"
. inc/init.sh
IMAGE=serh/docker-php71-for-magento22
docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
	    -e TZ="$TZ" \
            --link mysql_mag:db \
            -v ${PWD}/mag:/usr/share/nginx \
	    -v ${PWD}/inc/crontab:/etc/cron.d/crontab \
            -v ${PWD}/inc/php.ini:/usr/local/etc/php/php.ini \
            $IMAGE
#docker  exec -it ${CONTAINER} bash -c "/etc/init.d/cron start"
#docker  exec -it ${CONTAINER} bash -c "crontab -u root /etc/cron.d/crontab"
