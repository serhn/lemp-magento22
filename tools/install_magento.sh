#!/bin/sh
magento setup:install --base-url=http://127.0.0.1/magento2/ \
--db-host=localhost --db-name=magento \
--db-user=magento --db-password=magento \
--admin-firstname=Magento --admin-lastname=User --admin-email=user@example.com \
--admin-user=admin --admin-password=admin123 --language=en_US \
--currency=USD --timezone=America/Chicago --cleanup-database \
--sales-order-increment-prefix="ORD$" --session-save=db --use-rewrites=1
