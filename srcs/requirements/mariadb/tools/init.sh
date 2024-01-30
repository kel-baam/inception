#!/bin/bash

service mysql start

echo -e "\ny\ny\nabc\nabc\ny\ny\ny\ny\n" | ./usr/bin/mysql_secure_installation

# cp -R /mariadb.conf   /etc/mysql/mariadb.conf.d/50-server.cnf

# mysql < /setupDB.sql

mysqld