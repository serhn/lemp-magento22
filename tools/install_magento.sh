#!/bin/sh
. inc/.env
echo "magento setup:install --base-url=http://${URL}/magento2/ \
--db-host=${DB_HOST} --db-name=${DB_NAME} \
--db-user=${DB_USER} --db-password=${DB_PASS} \
--admin-firstname=${ADMIN_FIRSTNAME} --admin-lastname=${ADMIN_LASTNAME} --admin-email=${ADMIN_EMAIL} \
--admin-user=admin --admin-password=${ADMIN_PASS} --language=${LANG} \
--currency=${CURRENCY} --timezone=${TZ} --cleanup-database \
--sales-order-increment-prefix=\"ORD$\" --session-save=db --use-rewrites=1"
