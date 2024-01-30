#!/bin/bash


cd /var/www/html

mkdir wordpress 

cd wordpress 

wget https://wordpress.org/latest.tar.gz && \
    tar -zxvf latest.tar.gz  

rm -rf latest.tar.gz



wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cp -R /wp-config-sample.php wp-config.php

apt-get install -y php-fpm

service php-fpm8.2 start

echo "[www]

user = www-data
group = www-data

listen = 9000

listen.owner = www-data
listen.group = www-data

pm = dynamic


pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3" > /etc/php/8.2/fpm/pool.d/www.conf

wp core install --url=https://localhost --title="inception" --admin_user="kaoutar" --admin_password="123456789" --admin_email="localhost@gmail.com" --allow-root


php-fpm8.2 -F