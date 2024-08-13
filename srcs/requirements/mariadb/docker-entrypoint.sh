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

mysql -u root -e "create database if not exists wordpress;"
mysql -u root -e "create user 'user01'@'%' identified by 'password';"
mysql -u root -e "grant all on wordpress.* to 'user01'@'%';"
# mysql -u root wordpress < file.sql

service mysql stop

exec "$@"