FROM debian:buster

ARG WORDPRESS_DB_PASSWORD
ARG WORDPRESS_DB_NAME
ARG WORDPRESS_DB_USER
ARG WORDPRESS_DB_HOST
RUN apt-get update -y

RUN     apt-get update && apt-get install -y sed
RUN   apt-get install -y  wget unzip php-mysqlnd 
WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -zxvf latest.tar.gz  

RUN cp -R wordpress/* .

RUN rm -rf wordpress 

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wp-config-sample.php wp-config.php

RUN sed -i "s/WP_DB_NAME/${WORDPRESS_DB_NAME}/" wp-config.php
RUN sed -i "s/WP_DB_USER/${WORDPRESS_DB_USER}/" wp-config.php
RUN sed -i "s/WP_DB_PASSWORD/${WORDPRESS_DB_PASSWORD}/" wp-config.php
RUN sed -i "s/WP_DB_HOST/$WORDPRESS_DB_HOST/" wp-config.php
RUN cat wp-config.php
RUN  apt-get install -y php7.3-fpm

RUN mkdir -p /run/php/

COPY  ./conf/www.conf  /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/run.sh / 

RUN chmod 777 /run.sh


CMD ["/run.sh"]