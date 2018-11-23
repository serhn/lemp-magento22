#!/bin/sh
curl -o mag.tar.gz -L https://github.com/magento/magento2/archive/2.2.6.tar.gz
tar zxvf mag.tar.gz
rm mag.tar.gz
rm -rf mag 
mv magento2-2.2.6 mag
