#Redis Image
FROM  reg.linux.io/base_images/centos:7.7.1908

MAINTAINER Imirsh  "1071102039@qq.com"

ADD redis-4.0.14.tar.gz /usr/local/src
RUN ln -sv /usr/local/src/redis-4.0.14 /usr/local/redis && \
    cd /usr/local/redis && \
    make && \
    cp src/redis-cli /usr/sbin/ && \
    cp src/redis-server  /usr/sbin/ && \
    mkdir -pv /data/redis-data 

ADD redis.conf /usr/local/redis/redis.conf 
ADD run_redis.sh /usr/local/redis/run_redis.sh

EXPOSE 6379

CMD ["/usr/local/redis/run_redis.sh"]
