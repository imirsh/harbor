#!/bin/bash
#
docker build -t reg.linux.io/baseimages/tomcat:8.0.46 .
sleep 1
docker push reg.linux.io/baseimages/tomcat:8.0.46
