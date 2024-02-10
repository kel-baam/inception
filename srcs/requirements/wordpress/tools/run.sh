#!/bin/bash

wp core install --url="${WORDPRESS_URL}" --title="${WORDPRESS_TITLE}" --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_DB_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --allow-root
wp user create ${WORDPRESS_EDITOR_USER} ${WORDPRESS_EDITOR_EMAIL} --role="${WORDPRESS_EDITOR_ROLE}" --user_pass="${WORDPRESS_EDITOR_PASS}" --allow-root

php-fpm7.3 -F