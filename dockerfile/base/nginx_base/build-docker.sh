#!/bin/bash
docker build -t reg.linux.io/base_images/nginx:v1.18.0  .
sleep 1
docker push  reg.linux.io/base_images/nginx:v1.18.0
