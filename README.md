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

## Manage the environment

### Create the containers
In this repository, you can find the **tdiw.sh** script, which will create an Apache + PHP service to perform the P8 exercise. 
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

## Access to the website
> [!IMPORTANT]  
> The Apache workdir is the same path where you ran the script; modify the index.php or add more PHP files in the same path where the script was run

### Cookies with no sessions case

[http://localhost/index.php](http://localhost/index.php)

### Cookies with session case

[http://localhost/sessions.php](http://localhost/sessions.php)
