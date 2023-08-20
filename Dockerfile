FROM richarvey/nginx-php-fpm:1.9.1

COPY . .

# Image config
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Laravel config
ENV APP_ENV production
ENV APP_DEBUG false
ENV LOG_CHANNEL stderr

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

# Set working directory to Laravel's root directory
WORKDIR /var/www/html

# Install composer dependencies (assuming you have a composer.json file)
RUN composer global require hirak/prestissimo
RUN composer install --no-dev

# Expose port 80 for the web server
EXPOSE 80

CMD ["/start.sh"]
