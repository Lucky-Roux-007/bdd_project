FROM php:8.2-apache

# Install the drivers and enable them
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
