#!/bin/bash

docker service create \
	--name hadoop-master-forwarder \
	--constraint node.hostname==srv-hadoop-master \
	--network hadoop-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hadoop-master \
	--env REMOTE_PORT=50070 \
	--env LOCAL_PORT=50070 \
	--publish mode=host,published=50070,target=50070 \
	adimpp7/port-forward

docker service create \
	--name hadoop-master-forwarder-jh \
	--constraint node.hostname==srv-hadoop-master  \
	--network hadoop-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hadoop-master \
	--env REMOTE_PORT=19888 \
	--env LOCAL_PORT=19888 \
	--publish mode=host,published=19888,target=19888 \
	adimpp7/port-forward

docker service create \
	--name hadoop-slave1-forwarder \
	--constraint node.hostname==srv-hadoop-slave1 \
	--network hadoop-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hadoop-node022 \
	--env REMOTE_PORT=50075 \
	--env LOCAL_PORT=50075 \
	--publish mode=host,published=50075,target=50075 \
	adimpp7/port-forward

docker service create \
	--name hadoop-slave2-forwarder \
	--constraint node.hostname==srv-hadoop-slave2 \
	--network hadoop-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hadoop-slave2 \
	--env REMOTE_PORT=50075 \
	--env LOCAL_PORT=50075 \
	--publish mode=host,published=50075,target=50075 \
	adimpp7/port-forward

docker service create \
	--name hadoop-slave3-forwarder \
	--constraint node.hostname==srv-hadoop-slave3 \
	--network hadoop-net \
	--replicas 1 \
	--detach=true \
	--env REMOTE_HOST=hadoop-slave3 \
	--env REMOTE_PORT=50075 \
	--env LOCAL_PORT=50075 \
	--publish mode=host,published=50075,target=50075 \
	adimpp7/port-forward