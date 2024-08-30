#! /bin/bash

service mariadb start

mysql -u root -e "create database if not exists $MYSQL_DATABASE;"
mysql -u root -e "create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';"
mysql -u root -e "grant all on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';"

service mariadb stop

exec "$@"