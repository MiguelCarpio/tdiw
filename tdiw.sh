#!/bin/bash
set -e

# Removing old tdiw dockers
TDIW_DOCKERS=$(docker ps -a -q -f name=tdiw)
if [ ! -z "${TDIW_DOCKERS}" ]
then
    echo "Removing old tdiw dockers"
    docker rm -f $TDIW_DOCKERS
fi

# Create Dockerfile
cat <<EOF > Dockerfile
FROM php:8.3-apache

RUN apt-get update

# Install Postgre PDO
RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql
EOF

# Docker build
docker build -t apache-php-pdo_pgsql .

# Docker with apache-php-pdo_pgsql
docker run -d --name tdiw-php --network="host" -v "$PWD":/var/www/html apache-php-pdo_pgsql:latest

# Docker wireshark
docker run -d --restart unless-stopped --name tdiw-wireshark --net host --cap-add NET_ADMIN ffeldhaus/wireshark

# Remove Dockerfile
rm -f Dockerfile