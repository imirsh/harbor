#Tomcat 8.5.43基础镜像
FROM reg.linux.io/base_images/jdk:v8.212

MAINTAINER Imirsh "1071102039@qq.com"

RUN mkdir /apps /data/tomcat/webapps /data/tomcat/logs -pv 
ADD apache-tomcat-8.5.43.tar.gz  /apps
RUN useradd tomcat -u 2022 && ln -sv /apps/apache-tomcat-8.5.43 /apps/tomcat && chown -R tomcat.tomcat /apps /data -R
