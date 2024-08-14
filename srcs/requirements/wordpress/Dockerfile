FROM ubuntu:20.04

RUN apt-get update && apt-get install -y tzdata
ENV TZ Asia/Tokyo

RUN apt-get update && apt-get install -y php7.4 php-fpm php7.4-mysql
RUN apt-get remove apache2 -y
RUN apt-get purge apache2 -y
RUN rm -rf /etc/apache2

COPY ./requirements/wordpress/php.ini /etc/php/8.1/fpm/php.ini
# COPY ./requirements/wordpress/wordpress /var/www/wordpress

# RUN chown -R www-data:www-data /var/www/wordpress

CMD ["php-fpm7.4", "-F"]