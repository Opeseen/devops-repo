# File1
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
FROM ubuntu:latest AS BUILD_IMAGE
ENV packages="wget zip unzip"
RUN apt update && apt install $packages -y
WORKDIR /tmp
RUN wget https://www.tooplate.com/zip-templates/2128_tween_agency.zip
RUN unzip 2128_tween_agency.zip

FROM ubuntu:latest
WORKDIR /tmp
RUN apt update && apt install apache2 -y
COPY --from=BUILD_IMAGE tmp/* /tmp/
RUN rm *.zip
RUN cp -r /tmp/* /var/www/html
ENV DEBIAN_FRONTEND=noninteractive
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
VOLUME /var/log/apache2
EXPOSE 80
