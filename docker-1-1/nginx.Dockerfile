# Version: 0.0.1
FROM ubuntu:14.04
MAINTAINER Pavel Kamyshev
RUN apt-get update
RUN apt-get install -y nginx
#RUN echo 'Hi, I am in your container' \
#>/usr/share/nginx/html/index.html
ADD resources/tomcat.conf /etc/nginx/conf.d/tomcat.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
