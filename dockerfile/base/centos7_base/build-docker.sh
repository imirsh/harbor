#!/bin/bash
docker build -t reg.linux.io/base_images/centos:7.7.1908 .

docker push reg.linux.io/base_images/centos:7.7.1908
