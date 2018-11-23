#!/bin/sh
. inc/.env
docker  exec -it php_mag sh -c  "cd /usr/share/nginx; composer  install"
docker  exec -it php_mag sh -c  "cd /usr/share/nginx/bin; php magento setup:install --base-url=http://${URL}/magento2/ \
--db-host=${DB_HOST} --db-name=${DB_BASE} \
--db-user=${DB_USER} --db-password=${DB_PASS} \
--admin-firstname=${ADMIN_FIRSTNAME} --admin-lastname=${ADMIN_LASTNAME} --admin-email=${ADMIN_EMAIL} \
--admin-user=admin --admin-password=${ADMIN_PASS} --language=${LANG} \
--currency=${CURRENCY} --timezone=${TZ} --cleanup-database \
--sales-order-increment-prefix=\"ORD$\" --session-save=db --use-rewrites=1"
