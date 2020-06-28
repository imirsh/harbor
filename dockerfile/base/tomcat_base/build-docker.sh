#!/bin/bash
docker build -t reg.linux.io/base_images/tomcat:v8.5.43  .
sleep 3
docker push  reg.linux.io/base_images/tomcat:v8.5.43
