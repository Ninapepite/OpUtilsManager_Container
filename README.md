# OpUtilsManager_Container

This project allows you to run OpUtils in a container

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