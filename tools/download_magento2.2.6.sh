#!/bin/sh
curl -o mag.tar.gz -L https://github.com/magento/magento2/archive/2.2.6.tar.gz
tar zxvf mag.tar.gz
rm mag.tar.gz
if [  -f "mag" ]; 
then
mv mag mag_back
fi
mv magento2-2.2.6 mag
