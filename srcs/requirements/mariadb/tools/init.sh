#!/bin/bash


service mysql restart 

echo "CREATE USER IF NOT EXISTS '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';" >> setupDB.sql

echo "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};" >> setupDB.sql

echo "GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'%';" >> setupDB.sql

echo "FLUSH PRIVILEGES;" >> setupDB.sql

mysql < setupDB.sql

mysqld
