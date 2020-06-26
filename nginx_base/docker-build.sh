#!/bin/bash
#
docker build -t reg.linux.io/baseimages/nginx:1.14.2 .
sleep 1
docker push reg.linux.io/baseimages/nginx:1.14.2
