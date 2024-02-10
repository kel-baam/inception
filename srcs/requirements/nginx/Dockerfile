FROM debian:buster

RUN apt-get -y update

RUN apt-get -y install nginx
RUN apt-get install openssl -y


COPY ./conf/nginxConf.conf /etc/nginx/sites-available/default
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 777 /var/www/html
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=US/ST=NYC/O=1337/OU=1337/CN=kel-baam.42.fr"


CMD ["nginx", "-g", "daemon off;"]
