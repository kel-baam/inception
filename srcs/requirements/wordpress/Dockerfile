FROM debian:buster

RUN apt-get update -y

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

RUN  apt-get install -y php7.3-fpm

RUN mkdir -p /run/php/

COPY  ./conf/www.conf  /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/run.sh / 

RUN chmod 777 /run.sh


CMD ["/run.sh"]