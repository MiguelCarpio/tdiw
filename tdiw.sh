#!/bin/bash
set -e

#helpFunction()
#{
#   echo "Set '-m YES' if you want to allow the PASV method of obtaining a data connection or '-m NO' if you don't (Active mode)"
#   echo ""
#   echo "Usage: $0 -m YES"
#   echo "	OPTIONS             DESCRIPTION"
#   echo -e "\t-m YES              Passive mode enable"
#   echo -e "\t-m NO               Active mode enable"
#   exit 1 # Exit script after printing help
#}

FTP_CLIENT_DIR=ftp_client
FTP_CLIENT_CONFIG_DIR=$FTP_CLIENT_DIR/config
FTP_CLIENT_DATA_DIR=$FTP_CLIENT_DIR/data
PASV_ENABLE=YES

#while getopts "m:" opt
#do
#   case "$opt" in
#      m ) PASV_ENABLE="$OPTARG" ;;
#      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
#   esac
#done

# Print helpFunction in case parameter is empty
#if [ -z "$PASV_ENABLE" ]
#then
#   helpFunction
#fi

# Print helpFunction in case parameter is wrong
#if [ ! $PASV_ENABLE == "YES" ] && [ ! $PASV_ENABLE == "NO" ]
#then
#   helpFunction
#fi

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

# Remove Dockerfile
rm -f Dockerfile

# Create FTP client directories
if [ ! -d "$FTP_CLIENT_CONFIG_DIR" ]; then
    mkdir -p $FTP_CLIENT_CONFIG_DIR
fi
if [ ! -d "$FTP_CLIENT_DATA_DIR" ]; then
    mkdir -p $FTP_CLIENT_DATA_DIR
fi

# Docker with a custom user account, binding a data directory and enabling both active and passive mode:
docker run -d -v ${PWD}/ftp_server:/home/vsftpd \
-p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
-e FTP_USER=tdiw -e FTP_PASS=tdiw \
-e PASV_ADDRESS=127.0.0.1 -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 \
-e PASV_ENABLE=${PASV_ENABLE} \
--name tdiw-vsftpd --restart=always fauria/vsftpd

# FileZilla docker container
docker run -d \
    --name=tdiw-filezilla \
    --network="host" \
    -v ${PWD}/ftp_client/config:/config:rw \
    -v ${PWD}/ftp_client/data:/storage:rw \
    --restart=always \
    jlesage/filezilla

# Docker wireshark
docker run -d --restart unless-stopped --name tdiw-wireshark --net host --cap-add NET_ADMIN ffeldhaus/wireshark