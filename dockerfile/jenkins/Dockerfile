#Jenkins Version 2.190.1
FROM reg.linux.io/base_images/jdk:v8.212

MAINTAINER Imirsh "1071102039@qq.com"


ADD jenkins-2.190.1.war /apps/jenkins/
ADD run_jenkins.sh /usr/bin/


EXPOSE 8080 

CMD ["/usr/bin/run_jenkins.sh"]
