FROM reg.linux.io/baseimages/centos:7.7.1908
MAINTAINER imirsh 1071102039@qq.com

ADD filebeat-7.6.1-x86_64.rpm /tmp
RUN yum install -y /tmp/filebeat-7.6.1-x86_64.rpm vim wget tree lrzsz gcc gcc-c++ automake pcre pcre-devel zlib zlib-devel openssl-devel iproute net-tools iotop \
    && rm -rf /etc/localtime /tmp/filebeat-7.6.1-x86_64.rpm /tmp \
    && ln -snf /usr/share/zoneinfo/Asia/Shanhai /etc/localtime  \
    && useradd -u 2020 nginx  \
    && useradd -u 2021 www 

