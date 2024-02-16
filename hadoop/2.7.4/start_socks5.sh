#! /bin/bash

docker service create \
	--name proxy_docker \
	--network hadoop-net \
	--replicas 1 \
	--detach=true \
	--publish 7001:7001 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	adimpp7/docker-proxy