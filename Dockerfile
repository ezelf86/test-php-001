FROM php:8.2.20-apache

# Copiar el código fuente
COPY ./www/html /var/www/html/

# Configurar el directorio de trabajo
WORKDIR /var/www/html/

RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf

# Exponer el puerto 80
EXPOSE 80

# Ajustar permisos y propietarios si es necesario (opcional)
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Instalar extensiones adicionales de PHP (opcional)
RUN docker-php-ext-install pdo pdo_mysql

# Instalar dependencias de Composer (opcional)
# COPY composer.json composer.lock /var/www/html/
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# RUN composer install
