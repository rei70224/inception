# FROM ubuntu:20.04
FROM debian:bullseye

# RUN apt-get update && apt-get install -y tzdata
# ENV TZ Asia/Tokyo

RUN apt-get update && apt-get install -y nginx
COPY ./requirements/nginx/wordpress.conf /etc/nginx/sites-available/wordpress.conf
COPY ./requirements/nginx/wordpress.conf /etc/nginx/sites-enabled/wordpress.conf
# EXPOSE 443
CMD ["nginx","-g","daemon off;"]

# COPY ./srcs/requirements/nginx.conf /etc/nginx/nginx.conf