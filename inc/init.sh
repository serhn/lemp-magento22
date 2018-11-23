if [ -z "$CONTAINER" ]; then
CONTAINER=$(echo $0 | sed 's#.*/run_[0-9]*\(.*\).sh$#\1#g')
fi
PROJECT_DIR="${PWD}/../"
#PHP_VERSION=$(ls ${PWD} | grep -E "^run_[0-9]*(php[0-9]+)." | sed "s/run_[0-9]*\(php.*\).sh/\1/g")

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

#ADD_LINKS=""

if [ "$(docker ps -q -f name=$CONTAINER)" ]; then
   docker stop  $CONTAINER
   docker rm  $CONTAINER
fi
if [ ! -f "inc/.env" ]
then
cp inc/.env.default inc/.env
DB_PASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1);
ADMIN_PASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1);
sed -i "s/^DB_PASS=.*/DB_PASS=${DB_PASS}/" inc/.env
sed -i "s/^ADMIN_PASS=.*/ADMIN_PASS=${ADMIN_PASS}/" inc/.env
fi
if [ ! -f "inc/php.ini" ]
then
cp inc/php.ini-production inc/php.ini
fi
. inc/.env
