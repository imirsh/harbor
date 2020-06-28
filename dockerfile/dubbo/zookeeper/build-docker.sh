#!/bin/bash
TAG=$1
docker build -t reg.linux.io/dubbo/zookeeper:v3.4.14 .
sleep 1
docker push   reg.linux.io/dubbo/zookeeper:v3.4.14
