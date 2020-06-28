#Dubbo provider
FROM reg.linux.io/base_images/jdk:v8.212

MAINTAINER Imirsh "1071102039@qq.com"

RUN yum install file nc -y
RUN mkdir -p /apps/dubbo/provider && useradd tomcat
ADD dubbo-demo-provider-2.1.5/  /apps/dubbo/provider
ADD run_java.sh /apps/dubbo/provider/bin 
RUN chown tomcat.tomcat /apps -R
RUN chmod a+x /apps/dubbo/provider/bin/*.sh

CMD ["/apps/dubbo/provider/bin/run_java.sh"]
