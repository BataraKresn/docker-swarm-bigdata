#!/bin/bash

docker service create \
    --name hadoop-master \
    --hostname hadoop-master \
    --constraint node.role==manager \
    --network hadoop-net \
    --replicas 1 \
    --detach=true \
    --endpoint-mode dnsrr \
    --mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/master,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/master,target=/usr/local/hadoop/logs \
    --mount type=bind,src=/data/hadoop/submit/,dst=/submit \
    adimpp7/hadoop:2.7.4

docker service create \
    --name hadoop-slave1 \
    --hostname hadoop-slave1 \
    --network hadoop-net \
    --replicas 1 \
    --endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/slave1,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave1,target=/usr/local/hadoop/logs \
	adimpp7/hadoop:2.7.4

docker service create \
    --name hadoop-slave2 \
    --hostname hadoop-slave2 \
    --network hadoop-net \
    --replicas 1 \
    --endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/slave2,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave2,target=/usr/local/hadoop/logs \
	adimpp7/hadoop:2.7.4

docker service create \
    --name hadoop-slave3 \
    --hostname hadoop-slave3 \
    --network hadoop-net \
    --replicas 1 \
    --endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/slave3,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave3,target=/usr/local/hadoop/logs \
	adimpp7/hadoop:2.7.4