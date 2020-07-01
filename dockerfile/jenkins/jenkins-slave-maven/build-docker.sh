#!/bin/bash
docker build -t reg.linux.io/base_images/jnlp-slave-maven:3.6.2 .

docker push reg.linux.io/base_images/jnlp-slave-maven:3.6.2
