# TDIW Problems & Solutions
Tecnologies de desenvolupament per a Internet i Web / Problems and Solutions

SESSIÓ DE PROBLEMES 8 – Maneig de l’estat

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

## Create the environment
In this repository, you can find the **tdiw.sh** script, which will create two containers, one with Apache + PHP service and another with PostgreSQL DB, and the data needed to perform the P8 exercise. 
To create the environment, just run the **tdiw.sh** script
```shell
./tdiw.sh
```

## Destroy the environment
To destroy the tdiw containers, run the following commands:
```shell
docker rm -f tdiw-php
```

## Access to the website
> [!IMPORTANT]  
> The Apache workdir is the same path where you ran the script; modify the index.php or add more PHP files in the same path where the script was run

### Cookies with no sessions case

[http://localhost/index.php](http://localhost/index.php)

### Cookies with session case

[http://localhost/sessions.php](http://localhost/sessions.php)