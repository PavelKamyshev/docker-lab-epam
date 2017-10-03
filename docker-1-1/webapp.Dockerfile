FROM ubuntu:14.04
MAINTAINER Pavel Kamyshev
COPY resources/sample.war /opt/tomcat/webapps/sample.war
VOLUME /opt/tomcat/webapps/
CMD sleep infinity
