# TDIW
Tecnologies de desenvolupament per a Internet i Web

SESSIÓ DE PROBLEMES 3 – Programació a la banda del client (JavaScript)

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
For our environment, we recommended using docker containers. You can install it with https://docs.docker.com/engine/install/ or use the following script https://github.com/docker/docker-install.git
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
In this repository, you can find the **tdiw.sh** script, which will create an Apache + PHP service via a docker container. 
To create the environment, just run the **tdiw.sh** script
```shell
./tdiw.sh
```

## List the running containers
```shell
docker ps
```

## Destroy the environment
> [!CAUTION]
> This will remove all your running and stop TDIW docker containers
```shell
docker rm -v -f $(docker ps -a -q -f name=tdiw)
```

## Access to the website
> [!IMPORTANT]  
> The Apache workdir is the same path where you ran the script; modify the index.php or add more PHP files in the same path where the script was run

[http://localhost](http://localhost)