FROM reg.linux.io/baseimages/centos:7.7.1908

MAINTAINER imirsh 1071102039@qq.com

RUN yum install -y vim wget tree lrzsz gcc gcc-c++ automake make pcre pcre-devel zlib zlib-devel openssl-devel iproute net-tools iotop
ADD nginx-1.14.2.tar.gz /usr/local/src/
RUN cd /usr/local/src/nginx-1.14.2 \
    && ./configure && make && make install \
    && ln -sv /usr/local/nginx/sbin/nginx /usr/sbin/nginx \
    && rm -rf /usr/local/src/nginx-1.14.2.tar.gz 
