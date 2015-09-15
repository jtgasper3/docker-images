FROM debian:jessie

MAINTAINER John Gasper <jtgasper3@gmail.com>

RUN apt-get update \
	&& apt-get -y install apache2 libapache2-mod-shib2 \
	&& apt-get clean

COPY httpd-foreground /usr/local/bin/

EXPOSE 80 443

CMD ["httpd-foreground"]