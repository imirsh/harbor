#!/bin/bash
docker build -t reg.linux.io/baseimages/zookeeper:3.4.14 .
docker push reg.linux.io/baseimages/zookeeper:3.4.14
