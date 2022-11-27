# File 1

FROM ubuntu:latest
LABEL "Project"="Vprofile"
LABEL "Author"="Opeyemi"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install apache2 -y
RUN apt install git -y
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
WORKDIR /var/www/html
VOLUME /var/log/apache2
ADD tween.tar.gz /var/www/html
# COPY tween.tar.gz /var/www/html


# File 2 TOMCAT

FROM tomcat:8-jre11
LABEL "Project"="Vprofile"
LABEL "Author"="Opeyemi"

RUN rm -rf /usr/local/tomcat/webapps/*
COPY vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD [ "catalina.sh", "run" ]
WORKDIR /usr/local/tomcat/
VOLUME /usr/local/tomcat/webapps


# File 3 MYSQL

FROM mysql:5.7.25
LABEL "Project"="Vprofile"
LABEL "Author"="Opeyemi"

ENV MYSQL_ROOT_PASSWORD="vprodbpass"
ENV MYSQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql



# File 4 NGINX

FROM nginx
LABEL "Project"="Vprofile"
LABEL "Author"="Opeyemi"

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginvproapp.conf /etc/nginx/conf.d/vproapp.conf