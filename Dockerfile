# VERSION 1.1.3
FROM keboola/base-php55
MAINTAINER Ondrej Vana <ondrej.vana@keboola.com>

WORKDIR /home

# Initialize
RUN echo "memory_limit = -1" >> /etc/php.ini
RUN git clone https://github.com/keboola/generic-extractor.git ./
RUN git checkout tags/0.2.2
RUN composer install --no-interaction
RUN composer require "keboola/ex-generic-qualtrics-preparser"
RUN php ./console.php gex:module add ./vendor/keboola/ex-generic-qualtrics-preparser/config.yml

ENTRYPOINT php ./run.php --data=/data
