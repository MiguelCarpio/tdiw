# TDIW Problems & Solutions
Tecnologies de desenvolupament per a Internet i Web / Problems and Solutions

SESSIÓ DE PROBLEMES 11 – Protocols de Serveis: Serveis Web i  Correu electrònic.

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
> [!IMPORTANT]  
> If you get an execute permissions error, run the following command line first and then the tdiw.sh
```shell
sudo chmod +x tdiw.sh
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

## Access to the website
> [!IMPORTANT]  
> The Node workdir is the src directory. You can modify/add files in the src directory. 

[http://localhost:3000](http://localhost:3000)

