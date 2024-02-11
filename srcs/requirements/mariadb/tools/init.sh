#!/bin/bash


service mysql restart 

cat >> setupDB.sql << EOF
CREATE USER IF NOT EXISTS '${WORDPRESS_DB_USER}'@'%' IDENTIFIED BY '${WORDPRESS_DB_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};
GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF



mysql < setupDB.sql

rm -rf setupDB.sql
