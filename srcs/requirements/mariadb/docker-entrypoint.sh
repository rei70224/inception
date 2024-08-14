#! /bin/bash

service mysql start

sleep 15

# if [ "$MYSQL_USER" -a "$MYSQL_PASSWORD" ]; then
#     echo "hoge"

# 	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" | "${mysql[@]}"

# 	if [ "$MYSQL_DATABASE" ]; then
# 		echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%' ;" | "${mysql[@]}"
# 	fi

# 	echo 'FLUSH PRIVILEGES ;' | "${mysql[@]}"
# fi

mysql -u root -e "create database if not exists $MYSQL_DATABASE;"
mysql -u root -e "create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';"
mysql -u root -e "grant all on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';"
# mysql -u root wordpress < file.sql

service mysql stop

exec "$@"