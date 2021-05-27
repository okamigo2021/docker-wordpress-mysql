FROM php:7.0-apache
RUN apt-get update -y && a2enmod rewrite
RUN apt-get update && docker-php-ext-install pdo pdo_mysql
WORKDIR /var/www/html
RUN apt-get install apt-utils -y && apt-get install wget -y && apt-get install tar -y
RUN cd ~ && wget https://wordpress.org/latest.tar.gz && tar zxvf latest.tar.gz && mv wordpress/* /var/www/html && chown -R www-data:www-data /var/www/html
COPY . /var/www/html
RUN rm -rf latest.tar.gz && rm -rf wordpress
EXPOSE 80 443
