FROM php:8.0-apache
EXPOSE 9875
COPY ./html /var/www/html
COPY ./wordpress.conf /etc/apache2/sites-enabled/wordpress.conf
RUN a2enmod rewrite
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

