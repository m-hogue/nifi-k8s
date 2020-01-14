FROM centos:latest

RUN yum install -y \
       java-1.8.0-openjdk \
       java-1.8.0-openjdk-devel

ENV JAVA_HOME /etc/alternatives/jre

ADD run.sh /run.sh

RUN chmod +x run.sh

ENTRYPOINT ["/run.sh"]