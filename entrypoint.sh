#!/bin/sh

shutdown () {
    kill -s QUIT $CHILD_PROCESS
}

sed -i "s/APPLICATION_BACK/$APPLICATION_BACK/g" /etc/nginx/conf.d/default.conf

trap "shutdown" SIGTERM

nginx -g "daemon off;" &
CHILD_PROCESS=$!

wait $CHILD_PROCESS
exit $?
