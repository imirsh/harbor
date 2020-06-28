#!/bin/bash
docker build -t  reg.linux.io/base_images/jenkins:v2.190.1 .
echo "镜像制作完成，即将上传至Harbor服务器"
sleep 1
docker push reg.linux.io/base_images/jenkins:v2.190.1
echo "镜像上传完成"
