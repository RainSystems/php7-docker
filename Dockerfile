FROM php:7-apache

RUN a2enmod rewrite && \
    apt-get update -y && apt-get install -y \
    git \
    imagemagick \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libmemcached-dev \
    libpng12-dev \
    libpq-dev \
    npm \
    php5-xdebug \
    ruby && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    docker-php-ext-install \
    bcmath \
    exif \
    gd \
    mbstring \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    zip && \
    pecl install apcu && \
    gem install -n /usr/bin sass && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
