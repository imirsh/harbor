#!/bin/bash
#
docker build -t reg.linux.io/baseimages/jdk:8u172 .
sleep 1
docker push reg.linux.io/baseimages/jdk:8u172
