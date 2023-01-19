FROM ubuntu:latest
ENV packages="wget apache2 zip unzip"
RUN apt update && apt install $packages -y
WORKDIR /tmp
RUN wget https://www.tooplate.com/zip-templates/2128_tween_agency.zip
RUN mkdir -p /tmp/tween_data
RUN unzip 2128_tween_agency.zip
RUN cp -r 2128_tween_agency/* /tmp/tween_data
ENV DEBIAN_FRONTEND=noninteractive
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
VOLUME /var/log/apache2
EXPOSE 80


# File2
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
# ADD tween.tar.gz /var/www/html

# File3
FROM ubuntu:latest
ENV packages="wget zip apache2 unzip"
RUN apt update && apt install $packages -y
WORKDIR /tmp
RUN wget https://www.tooplate.com/zip-templates/2128_tween_agency.zip
RUN unzip 2128_tween_agency.zip
RUN cp -r 2128_tween_agency/* /var/www/html
ENV DEBIAN_FRONTEND=noninteractive
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
VOLUME /var/log/apache2
EXPOSE 80

# File4
FROM ubuntu:latest AS BUILD_IMAGE
ENV packages="wget zip unzip"
RUN apt update && apt install $packages -y
WORKDIR /tmp
RUN wget https://www.tooplate.com/zip-templates/2128_tween_agency.zip
RUN mkdir -p /tmp/tween_data
RUN unzip 2128_tween_agency.zip
RUN rm -rf *.zip /tmp/

RUN cp -r 2128_tween_agency/* /tmp/tween_data

FROM ubuntu:latest
WORKDIR /tmp
RUN apt update && apt install apache2 -y
COPY --from=BUILD_IMAGE tmp/* /tmp/
RUN cp -r /tmp/* /var/www/html
ENV DEBIAN_FRONTEND=noninteractive
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
VOLUME /var/log/apache2
EXPOSE 80
