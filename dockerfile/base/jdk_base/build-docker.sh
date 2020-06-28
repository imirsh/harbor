#!/bin/bash
docker build -t reg.linux.io/base_images/jdk:v8.212 .

docker push reg.linux.io/base_images/jdk:v8.212
