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
cd src
cat <<EOF > Dockerfile
FROM node
WORKDIR /
COPY package.json ./
RUN npm install
COPY . ./
CMD ["npm", "run", "start"]
EOF

# Docker build
docker build -t tdiw-node-img .

# Docker with apache-php-pdo_pgsql
docker run -d --name tdiw-node --network="host" tdiw-node-img

# Remove Dockerfile
rm -f Dockerfile