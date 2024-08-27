FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx
COPY ./requirements/nginx/wordpress.conf /etc/nginx/sites-available/wordpress.conf
COPY ./requirements/nginx/wordpress.conf /etc/nginx/sites-enabled/wordpress.conf
COPY ./requirements/nginx/ssl /etc/nginx/ssl
CMD ["nginx","-g","daemon off;"]
