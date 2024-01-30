FROM debian

RUN apt-get update -y

RUN   apt-get install -y php php-common php-cli php-mbstring unzip wget  php-mysqlnd

COPY ./tools/wp-config-sample.php /

COPY ./tools/script.sh /

RUN chmod +x /script.sh


CMD ["/script.sh"]