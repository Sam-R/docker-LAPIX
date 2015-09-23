# docker-LAPIX
docker container with Linux, Apache, PHP, ImageMagick, Xdebug

Based on:
tutum/apache-php

Includes:
* git
* nano
* imagemagick
* libmagickcore-dev
* libmagickwand-dev
* php5-imagick
* inkscape
* php5-xdebug


# Build docker

Build the docker imange (you need to be inside the directory the repo is downloaded into). You can optionally change it's name.

``` sh
docker build -t samr/apache-php-xdebug .
```

# Run docker

Exposing port 80 on localhost, with the local directory connected as the web app. Enable .htaccess files.

``` sh
docker run -d -p 80:80 -v $(pwd):/app -e ALLOW_OVERRIDE=true
```

Without .htaccess
``` sh
docker run -d -p 80:80 -v $(pwd):/app
```
