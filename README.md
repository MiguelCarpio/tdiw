# TDIW
Tecnologies de desenvolupament per a Internet i Web

SESSIÓ DE PROBLEMES 4 – Programació a la banda del servidor (PHP)

## Requirements
### Operating System
Use linux Ubuntu or Fedora 

### Install git
Ubuntu
```shell
sudo apt-get install git -y
```

Fedora
```shell
sudo dnf install git -y
```

### Install docker
In this session and the following, we must run containers to perform and test the exercises.
For our environment, we recommended using docker containers. You can install it with https://docs.docker.com/engine/install/ or use the following script https://github.com/docker/docker-install.git.
```shell
git clone https://github.com/docker/docker-install.git
cd docker-install/
./install.sh
```

> [!IMPORTANT]  
> After the installation, add your user to the docker group 
>```shell
>sudo usermod -aG docker ${USER}
>su - ${USER} #You must start a new session to see the change
>```

## Manage the environment

### Create the containers
In this repository, you can find the **tdiw.sh** script, which will create two containers, one with Apache + PHP service and another with PostgreSQL DB, and the data needed to perform the P4 exercise. 
To create the environment, just run the **tdiw.sh** script
```shell
./tdiw.sh
```

### List the running containers
```shell
docker ps
```

### Stop the containers
```shell
docker stop $(docker ps -a -q -f name=tdiw)
```

### Start the containers
```shell
docker start $(docker ps -a -q -f name=tdiw)
```

### Destroy the environment
> [!CAUTION]
> This will remove all your running and stop TDIW docker containers
```shell
docker rm -v -f $(docker ps -a -q -f name=tdiw)
```

## Query the DB
You can query the tables graus and mencions with the following command lines
```shell
docker run -i --rm --network="host" -e PGPASSWORD=password postgres psql -v ON_ERROR_STOP=1 -U david -h localhost -w myDB <<-EOSQL
        SELECT * FROM graus;
EOSQL
docker run -i --rm --network="host" -e PGPASSWORD=password postgres psql -v ON_ERROR_STOP=1 -U david -h localhost -w myDB <<-EOSQL
        SELECT * FROM mencions;
EOSQL
```
## Access to the website
> [!IMPORTANT]  
> The Apache workdir is the same path where you ran the script; modify the index.php or add more PHP files in the same path where the script was run

[http://localhost](http://localhost)

## Check your php scripts
Using the following command line, you can check your php scripts to find errors or miscoding. It's recommended that the index.php file be checked because all php scripts included there will be checked too. However, you can check each php script if you want.  
```shell
docker run -it --rm --name my-running-script --network="host" -v "$PWD":/usr/src/myapp -w /usr/src/myapp apache-php-pdo_pgsql php index.php
```