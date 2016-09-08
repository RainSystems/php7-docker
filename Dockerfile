FROM php:7-apache

RUN a2enmod rewrite && \
    curl -vs https://download.newrelic.com/548C16BF.gpg | apt-key add - && \
    echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list && \
    apt-get update && apt-get install -y \
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
    echo newrelic-php5 newrelic-php5/application-name string "App Name" | debconf-set-selections && \
    echo newrelic-php5 newrelic-php5/license-key string "LICENSE_KEY" | debconf-set-selections && \
    apt-get install -y newrelic-php5 && \
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
    mv composer.phar /usr/local/bin/composer && \
    rm -rf /var/www/*
