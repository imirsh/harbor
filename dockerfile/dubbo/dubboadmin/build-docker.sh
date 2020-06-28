#!/bin/bash
TAG=$1
docker build -t  reg.linux.io/dubbo/admin:v1 .
sleep 3
docker push  reg.linux.io/dubbo/admin:v1
