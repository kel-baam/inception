FROM debian:buster

RUN apt-get update -y

RUN  apt-get install -y mariadb-server

# RUN service mysql restart && echo -e "\ny\ny\nabc\nabc\ny\ny\ny\ny\n" | ./usr/bin/mysql_secure_installation

COPY ./tools/setupDB.sql  setupDB.sql

COPY ./conf/mariadb.conf   /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql restart &&  mysql < setupDB.sql

# RUN service mysql restart && mysql < setupDB.sql
COPY ./tools/init.sh/ /
RUN chmod +x /init.sh

# insert prompts answers here
CMD ["/init.sh"]