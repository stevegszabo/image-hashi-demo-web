#!/bin/sh

shutdown () {
    kill -s QUIT $CHILD_PROCESS
}

DOCKER_TAG=${DOCKER_TAG-00000}
export DOCKER_TAG

sed -i "s/APPLICATION_BACK/$APPLICATION_BACK/g" /etc/nginx/conf.d/default.conf

trap "shutdown" SIGTERM

nginx -g "daemon off;" &
CHILD_PROCESS=$!

wait $CHILD_PROCESS
exit $?
