#!/bin/bash
#
docker build -t reg.linux.io/baseimages/centos:7.7.1908 .
sleep 1
docker push reg.linux.io/baseimages/centos:7.7.1908
