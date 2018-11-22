#!/bin/sh
. inc/init.sh
IMAGE=serh/docker-php71-for-magento22

docker run  -d \
            --restart unless-stopped  \
            --name="$CONTAINER" \
	    -e TZ="$TZ" \
            --link mysql57:db \
            -v ${PROJECT_DIR}:/usr/share/nginx \
            -v ${PWD}/inc/php.ini:/usr/local/etc/php/php.ini \
	    -v ${PWD}/inc/crontab:/etc/cron.d/crontab \
            $IMAGE
#docker  exec -it ${CONTAINER} bash -c "/etc/init.d/cron start"
#docker  exec -it ${CONTAINER} bash -c "crontab -u root /etc/cron.d/crontab"
