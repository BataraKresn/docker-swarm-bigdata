#!/bin/bash

docker service create \
	--name hive-forwarder \
	--constraint node.hostname==srv-hadoop-master \
	--network hadoop-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hadoop-master \
	--env REMOTE_PORT=33060 \
	--env LOCAL_PORT=3306 \
	--publish mode=host,published=3306,target=3306 \
	adimpp7/port-forward