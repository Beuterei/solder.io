FROM php:7.4-apache

EXPOSE 80

COPY phpIni /usr/local/etc/

RUN apt-get update && apt-get -y install git libzip-dev zip \
    && apt-get clean -y

RUN docker-php-ext-install mysqli pdo pdo_mysql zip \
    && docker-php-ext-enable pdo_mysql

RUN git clone https://github.com/TheGameSpider/TechnicSolder.git /var/www/html

WORKDIR /var/www/html

RUN chown -R www-data .

RUN a2enmod rewrite && service apache2 restart

COPY scripts/ scripts/

RUN chmod +x scripts/script.sh

CMD scripts/script.sh