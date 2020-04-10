FROM php:7.4-fpm-alpine

RUN apk add --update bash \
	&& rm -rf /var/cache/apk/* \
	&& apk add vim

RUN docker-php-ext-install mysqli

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

