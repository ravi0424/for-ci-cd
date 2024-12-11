FROM php:7.4-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN a2enmod rewrite
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html/
EXPOSE 80
COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf
RUN apache2ctl restart
CMD ["apache2ctl", "-D", "FOREGROUND"]
