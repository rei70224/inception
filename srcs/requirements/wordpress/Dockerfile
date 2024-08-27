FROM debian:bullseye

RUN apt-get update && apt-get install -y php php-fpm php-mysql
RUN apt-get remove apache2 -y
RUN apt-get purge apache2 -y
RUN rm -rf /etc/apache2
RUN apt-get install -y curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./requirements/wordpress/php.ini /etc/php/7.4/fpm/php.ini
COPY ./requirements/wordpress/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY ./requirements/wordpress/wordpress.sh /usr/local/bin/wordpress.sh
ENTRYPOINT [ "/usr/local/bin/wordpress.sh" ]

CMD ["php-fpm7.4", "-F"]
