#Dubbo consumer
FROM reg.linux.io/base_images/jdk:v8.212

MAINTAINER Imirsh "1071102039@qq.com"

RUN yum install file -y
RUN mkdir -p /apps/dubbo/consumer && useradd tomcat
ADD dubbo-demo-consumer-2.1.5  /apps/dubbo/consumer
ADD run_java.sh /apps/dubbo/consumer/bin 
RUN chown tomcat.tomcat /apps -R
RUN chmod a+x /apps/dubbo/consumer/bin/*.sh

CMD ["/apps/dubbo/consumer/bin/run_java.sh"]
