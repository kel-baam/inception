FROM debian:buster

ARG WORDPRESS_DB_PASSWORD
ARG WORDPRESS_DB_NAME
ARG WORDPRESS_DB_USER

RUN apt-get update -y

RUN  apt-get install -y mariadb-server

RUN service mysql restart && echo -e "\ny\ny\nabc\nabc\ny\ny\ny\ny\n" | ./usr/bin/mysql_secure_installation

COPY ./conf/mariadb.conf   /etc/mysql/mariadb.conf.d/50-server.cnf

RUN echo "CREATE USER IF NOT EXISTS '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';">> setupDB.sql
RUN echo "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};">> setupDB.sql
RUN echo "GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'%';">> setupDB.sql
RUN echo "FLUSH PRIVILEGES;">> setupDB.sql
RUN service mysql restart && mysql < setupDB.sql


CMD ["mysqld"]

