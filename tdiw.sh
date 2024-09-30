#!/bin/bash
set -e

# Removing a previous tdiw-php docker
docker rm -f tdiw-php

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

# Remove Dockerfile
rm -f Dockerfile