# FROM --platform=linux/amd64 mysql:5.7

FROM ubuntu:20.04

RUN apt-get update && apt-get install -y tzdata
ENV TZ Asia/Tokyo

RUN apt-get update && apt-get install -y mariadb-server mariadb-client
EXPOSE 3306
COPY ./requirements/mariadb/my.conf /etc/mysql/my.cnf
RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld/
COPY ./requirements/mariadb/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./requirements/mariadb/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["mysqld"]
# CMD [ "bash" ]