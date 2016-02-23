# PHP QA TOOLS
- Set memory_limit to 2G

## Software list
1. PHPUnit
~~2. vfsStream~~
3. PHP Loc
4. PHP Depend
5. PHP Mess Detector
6. PHP Code Sniffer
7. PHP Copy/Paste Detector
8. phpDox
9. PhpMetrics
~~10. QA-Tools~~

### PHPUnit
I don't wanna ...
talk about it ...
how you broke my heart ...

### PHP Loc
https://github.com/sebastianbergmann/phploc
A tool for quickly measuring the size and analyzing the structure of a PHP project.
```
$ docker run --rm -i -v $(pwd):/var/www php-qa-tools phploc --log-csv=/var/www/public/report/phploc.csv /var/www/app
```

### PHP Depend
http://pdepend.org/documentation/getting-started.html
http://pdepend.org/documentation/software-metrics.html
Measuring the size and analyzing the structure of a PHP project.
```
$ docker run --rm -i -v $(pwd):/var/www php-qa-tools pdepend --summary-xml=/var/www/public/report/summary.xml --jdepend-chart=/var/www/public/report/jdepend.svg --overview-pyramid=/var/www/public/report/pyramid.svg /var/www/app
```
This command will report as an out put summary.xml jdepend.svg pyramid.svg

### PHP Mess Detector
http://phpmd.org/
Look for several potential problems within that source
These problems can be things like:
- Possible bugs
- Suboptimal code
- Overcomplicated expressions
- Unused parameters, methods, properties
```
$ docker run --rm -i -v $(pwd):/var/www php-qa-tools phpmd /var/www/app/repositories/CheckoutRepository.php xml --reportfile /var/www/public/report/phpmd.xml cleancode,codesize,controversial,design,naming,unusedcode
```
### PHP Code Sniffer
https://github.com/squizlabs/PHP_CodeSniffer/wiki/
```
$ docker run --rm -i -v $(pwd):/var/www php-qa-tools phpcs --standard=PSR1,PSR2 --report=xml --report-file=/var/www/public/report/phpcs.xml /var/www/app/repositories/CheckoutRepository.php
```

### PHP Copy/Paste Detector
https://github.com/sebastianbergmann/phpcpd
```
$ docker run --rm -i -v $(pwd):/var/www php-qa-tools phpcpd /var/www/app/controllers
```

### phpDox

### PhpMetrics
http://www.phpmetrics.org/
```
$ docker run --rm -i -v $(pwd):/var/www php-qa-tools phpmetrics --report-html=/var/www/public/report/phpmetrics.html /var/www/app
```
