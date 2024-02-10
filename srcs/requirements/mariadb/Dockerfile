FROM debian:buster

RUN apt-get update -y

RUN  apt-get install -y mariadb-server

RUN service mysql restart && echo -e "\ny\ny\nabc\nabc\ny\ny\ny\ny\n" | ./usr/bin/mysql_secure_installation

COPY ./conf/mariadb.conf   /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/init.sh .
RUN chmod +x init.sh



CMD ["./init.sh"]

