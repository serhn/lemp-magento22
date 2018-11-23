# lemp-magento22 instal on Linux

```sh
git clone https://github.com/serhn/lemp-magento22.git
cd lemp-magento
```

cd lemp-magento

start MYSQL PHP71 NGINX

```sh
./tools/restart_all.sh
```
edit inc/.env

download magento

```sh
./tools/download_magento2.2.6.sh
```

install magento

```sh
./tools/install_magento.sh
```

http://localhost:81