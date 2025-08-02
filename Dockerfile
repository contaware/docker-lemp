# Set the php version you need for your project
FROM php:8.4-fpm

# Set the php extensions you need for your project
RUN apt update && \
    apt install -y libfreetype-dev libjpeg62-turbo-dev libpng-dev libzip-dev zip && \
    pecl install xdebug && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install mysqli pdo pdo_mysql gd exif zip && \
    docker-php-ext-enable xdebug
