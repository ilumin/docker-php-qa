FROM alpine

ENV PHP_MEMORY_LIMIT 2G

RUN apk add --no-cache wget php php-pear php-phar php-json php-bz2 php-ctype \
    php-dom php-zlib php-iconv php-xsl \

 # Update php config 
 && sed -i "s|memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|" /etc/php/php.ini

 # PHPUnit - traditional unit test library for PHP
RUN wget --no-check-certificate https://phar.phpunit.de/phpunit.phar \
 && chmod +x phpunit.phar \
 && mv phpunit.phar /usr/bin/phpunit \
 && phpunit --version \

 # PHPLOC
 && wget --no-check-certificate https://phar.phpunit.de/phploc.phar \
 && chmod +x phploc.phar \
 && mv phploc.phar /usr/bin/phploc \
 && phploc --version \

 # PHP_Depend - php analyzer and metric tool
 && wget --no-check-certificate http://static.pdepend.org/php/latest/pdepend.phar \
 && chmod +x pdepend.phar \
 && mv pdepend.phar /usr/bin/pdepend \
 && pdepend --version \

 # PHP Mess Detector
 && wget --no-check-certificate http://static.phpmd.org/php/latest/phpmd.phar \
 && chmod +x phpmd.phar \
 && mv phpmd.phar /usr/bin/phpmd \
 && phpmd --version \

 # PHP_CodeSniffer - main package to check code sniffer
 && wget --no-check-certificate https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar \
 && chmod +x phpcs.phar \
 && mv phpcs.phar /usr/bin/phpcs \
 && phpcs --version \

  # PHP_CodeSniffer - automate script to correct code
 && wget --no-check-certificate https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar \
 && chmod +x phpcbf.phar \
 && mv phpcbf.phar /usr/bin/phpcbf \
 && phpcbf --version \

 # PHP Copy/Paste Detector
 && wget --no-check-certificate https://phar.phpunit.de/phpcpd.phar \
 && chmod +x phpcpd.phar \
 && mv phpcpd.phar /usr/bin/phpcpd \
 && phpcpd --version \

 # phpDox
 && wget --no-check-certificate https://github.com/theseer/phpdox/releases/download/0.8.0/phpdox-0.8.0.phar \
 && chmod +x phpdox-0.8.0.phar \
 && mv phpdox-0.8.0.phar /usr/bin/phpdox \
 && phpdox --version \

 # PhpMetrics
 && wget --no-check-certificate https://github.com/phpmetrics/PhpMetrics/raw/master/build/phpmetrics.phar \
 && chmod +x phpmetrics.phar \
 && mv phpmetrics.phar /usr/bin/phpmetrics \
 && phpmetrics --version \

 # DONE!
 && mkdir -p /var/www \
 && rm -rf /var/cache/apk/* \
 && echo "DONE!"

WORKDIR /var/www

VOLUME ["/var/www"]

CMD ["/usr/bin/php", "-a"]
