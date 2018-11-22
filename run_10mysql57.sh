#!/bin/sh
. inc/init.sh
MYSQL_LOCAL_DIR="$PWD/mysql57"
IMAGE="mysql:5.7.24"
DB_PORT="3306"
DB_ROOT_PASSWORD="sei0ohqu0Eghoo2aiPheiYu5ooveeSo9"
DB_DATABASE="magento"
if [ ! -d $MYSQL_LOCAL_DIR  ]
then
    #echo -n "Enter mysql ROOT PASSWORD: "
    #read MYSQL_ROOT_PASSWORD
    docker run \
        -e MYSQL_ROOT_PASSWORD=$DB_ROOT_PASSWORD \
        -e MYSQL_DATABASE=$DB_DATABASE \
        -d --name="$CONTAINER" $IMAGE
    docker exec  $CONTAINER sh -c "apt-get update && apt-get install -y procps"
    #docker exec -it mysql bash
    COUNT="0"
    START_CHECK="0"
    while [  $START_CHECK -le 0 ]
    do
       COUNT=$(( $COUNT + 1 ))
       sleep 1
       START_CHECK=`docker exec  $CONTAINER sh -c "ps xa | grep -E \"[0-9] mysqld$\" | grep -v grep | wc -l " | sed 's#[\n\r]##g'`
       echo "Wait start  ${COUNT}s"
    done
    mkdir ${MYSQL_LOCAL_DIR}
    docker cp -a $CONTAINER:/var/lib/mysql ${MYSQL_LOCAL_DIR}/db
    docker cp -a $CONTAINER:/var/log/mysql ${MYSQL_LOCAL_DIR}/log
    docker cp -a $CONTAINER:/etc/mysql ${MYSQL_LOCAL_DIR}/etc
    echo "$IMAGE" > ${MYSQL_LOCAL_DIR}/README.txt
    docker stop $CONTAINER
    docker rm  $CONTAINER
    echo "${BLUE}USER:root${NC}"
    echo "${BLUE}PASSWORD:${DB_ROOT_PASSWORD}${NC}"
fi
docker run -d \
    --restart unless-stopped  \
    --name=$CONTAINER   \
     -v ${MYSQL_LOCAL_DIR}/db:/var/lib/mysql  \
     -v ${MYSQL_LOCAL_DIR}/log:/var/log/mysql  \
     -v ${MYSQL_LOCAL_DIR}/etc:/etc/mysql  \
     -e TZ=Europe/Kiev \
     -p ${DB_PORT}:3306  \
        ${IMAGE}
echo "${BLUE}DB:${DB_DATABASE}${NC}"
