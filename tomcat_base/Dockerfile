FROM reg.linux.io/baseimages/jdk:8u172

MAINTAINER imrsh "1071102039@qq.com"

RUN mkdir /apps /date/tomcat/webapps /data/tomcat/logs/ -pv
ADD apache-tomcat-8.0.46.tar.gz /apps
RUN useradd tomcat -u 2022 && \
    ln -sv /apps/apache-tomcat-8.0.46 /apps/tomcat && \
    chown -R tomcat.tomcat /apps /data -R
