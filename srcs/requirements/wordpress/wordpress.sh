#! /bin/bash

cd /var/www/wordpress
# rm -rf /var/www/wordpress/wp-config.php && cd /var/www/wordpress
if [ ! -f wp-config.php ]; then
    wp core download --allow-root --locale=ja --path=/var/www/wordpress
    wp core config --allow-root \
                --dbname=$MYSQL_DATABASE \
                --dbuser=$MYSQL_USER \
                --dbpass=$MYSQL_PASSWORD \
                --dbhost=db
fi

wp core install --allow-root \
                --title=$WORDPRESS_TITLE \
                --admin_user=$WORDPRESS_ADMIN_USER \
                --admin_password=$WORDPRESS_ADMIN_PASS \
                --admin_email='croodofkoga@gmail.com' \
                --url=http://resaito.42.fr

wp user create --allow-root \
                $WORDPRESS_USER \
                resaito@student.42tokyo.jp \
                --user_pass=$WORDPRESS_USER_PASS

exec "$@"
