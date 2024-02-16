#!/bin/bash

docker service create \
	--name hadoop-proxy \
	--network hadoop-net \
	--replicas 1 \
	--detach=true \
	--publish 7001:7001 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	newnius/docker-proxy