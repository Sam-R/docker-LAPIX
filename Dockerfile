FROM tutum/apache-php

# Install additonal software
RUN apt-get update && apt-get install -yq \
	git \
	nano \
	imagemagick \
	libmagickcore-dev \
	libmagickwand-dev \
	php5-imagick \
	inkscape \
	php5-xdebug \
	&& rm -rf /var/lib/apt/lists/*

# Copy the external xdebug file and add it to the apache config dir
COPY external-xdebug.ini /etc/php5/apache2/conf.d/

# Enable PHP Errors
RUN sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini
RUN sed -i 's/display_startup_errors = Off/display_startup_errors = On/' /etc/php5/apache2/php.ini

# Clear everything from app and add current directory.
RUN rm -fr /app
ADD . /app
