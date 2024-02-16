#!/bin/bash

# Run hadoop first of all
bash /etc/start_hadoop.sh -bash

# start metastore
hive --service metastore

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi