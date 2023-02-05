# OpUtilsManager_Container

This project allows you to run OpUtils in a container

OpUtils documentation 

[Documentation](https://www.manageengine.com/products/oputils/help/ip-address-management.html)

## DockerHub

https://hub.docker.com/repository/docker/ninapepite/oputils/general

## Default account

admin/admin


## Docker CLI

Sample run :
```
docker run -d -p 8060:8060 ninapepite/oputils  
```
With persistant volume
```
docker run -d -p 8060:8060 -v oputils:/opt/ManageEngine/OpManager ninapepite/oputils  
```
Oputils needing dns resolver, I recommand you to use --dns argument, 
You can configure in web interface but it is better to use dns argument
```
docker run -d -p 8060:8060 --dns 192.168.1.1 -v oputils:/opt/ManageEngine/OpManager ninapepite/oputils
```
## Docker Compose

In this example I use the arguments of cpus and ram for a better performance in production
```
version: "3.9"

volumes:
  dataoputils:

services:
  oputils:
    build:
      context: ./
      dockerfile: Dockerfile
    restart: always
    container_name: oputils
    dns: 192.168.0.1
    ports:
      - 8060:8060
    volumes:
      - dataoputils:/opt/ManageEngine/OpManager
    mem_limit: "4g"
    cpus: 4
```

## Usage

At container starting, he start oputils service and webserver
You can watch progression with docker logs
```
docker logs container_name
```

If you use a persistant volume you can access a log file from /persistant_vol_path/OpManager/logs/

Or you can execute cat under container

```
docker exec -it  container_name bash
cat /opt/OpManager/logs/filename
```