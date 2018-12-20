#!/usr/bin/env bash

# First parameter is a comma-delimited string of service names i.e. service1,service2,service3
SERVICES=$1

ALL_SERVICES_STARTED=true

if [ $EUID -ne 0 ]; then
  if [ "$(id -u)" != "0" ]; then
    echo "root privileges are required" 1>&2
    exit 1
  fi
  exit 1
fi

for service in ${SERVICES//,/ }
do
    STATUS=$(service ${service} status | awk '{print $2}')

    if [ "${STATUS}" != "started" ]; then
        echo "${service} not started"
        ALL_SERVICES_STARTED=false
    fi
done

if ${ALL_SERVICES_STARTED} ; then
    echo "All services started"
    exit 0
else
    echo "trying to start rails server"
    rails server -b 0.0.0.0 -p 3000 > /dev/null 2>&1 &
    echo "Check Failed"
    rails server -b 0.0.0.0 -p 3000 > /dev/null 2>&1 &
    exit 1
fi
