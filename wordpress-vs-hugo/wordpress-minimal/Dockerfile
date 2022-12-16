FROM mariadb:10.6.4-focal
COPY ./wordpress-dump.sql /docker-entrypoint-initdb.d/wordpress-dump.sql
EXPOSE 3306