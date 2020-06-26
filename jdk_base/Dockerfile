FROM reg.linux.io/baseimages/centos:7.7.1908

MAINTAINER imirsh "1071102039@qq.com"

ADD jdk-8u172-linux-x64.tar.gz /usr/local/src/
RUN ln -sv /usr/local/src/jdk1.8.0_172 /usr/local/jdk
ADD profile /etc/profile

ENV JAVA_HOME /usr/local/jdk
ENV JRE_HOME $JAVA_HOMOE/jre
ENV CLASSPATH $JAVA_HOME/lib/:$JRE_HOME/lib/
ENV PATH $PATH:$JAVA_HOME/bin


