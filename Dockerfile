FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y tzdata
ENV TZ Asia/Tokyo

RUN apt-get install -y nginx
RUN apt-get install -y mariadb-server mariadb-client
RUN apt-get install -y curl unzip vim
RUN apt-get install -y php7.4 php-fpm php7.4-mysql

RUN apt-get remove apache2 -y
RUN apt-get purge apache2 -y
RUN rm -rf /etc/apache2

COPY ./php.ini /etc/php/8.1/fpm/php.ini
COPY ./wordpress /var/www/wordpress

# ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/
# vim /etc/nginx/sites-available/wordpress
COPY ./wordpress.conf /etc/nginx/sites-available/wordpress.conf
COPY ./wordpress.conf /etc/nginx/sites-enabled/wordpress.conf

# chown -R www-data:www-data /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

# service nginx start
CMD ["nginx","-g","daemon off;"]
# service php7.4-fpm start
# service mysql start

# CREATE DATABASE wordpress CHARACTER SET UTF8 COLLATE UTF8_BIN;
# CREATE USER 'user01'@'localhost' IDENTIFIED BY 'password';
# GRANT ALL ON wordpress.* to 'user01'@'localhost';

# docker container run --rm --interactive --tty --publish 8080:80 inception-test:1
