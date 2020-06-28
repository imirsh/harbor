#!/bin/bash
docker build -t reg.linux.io/dubbo/dubbo-demo-consumer:v1 .
sleep 3
docker push reg.linux.io/dubbo/dubbo-demo-consumer:v1
