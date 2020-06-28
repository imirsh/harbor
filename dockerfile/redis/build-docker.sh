#!/bin/bash
docker build -t reg.linux.io/base_images/redis:v4.0.14 .
sleep 3
docker push  reg.linux.io/base_images/redis:v4.0.14
