#! /bin/bash

wp core download --allow-root --locale=ja --path=/var/www/wordpress
rm -rf /var/www/wordpress/wp-config.php && cd /var/www/wordpress
wp core config --allow-root \
               --dbname=$MYSQL_DATABASE \
               --dbuser=$MYSQL_USER \
               --dbpass=$MYSQL_PASSWORD \
               --dbhost=db

wp core install --allow-root \
                --title='test' \
                --admin_user='test_user' \
                --admin_password='password' \
                --admin_email='croodofkoga@gmail.com' \
                --url=http://resaito.42.fr

exec "$@"
