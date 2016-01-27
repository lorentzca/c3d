# Cnsul Cluster on Docker

## Start

build

```
docker-compose build
```

up

```
docker-compose up
```

## Login to container

ex) login to server2

```
docker exec -it $(docker ps -q -f name=server2) bash
```

## Check members

ex) show members of server1 cluster

```
docker exec -it $(docker ps -q -f name=server1) consul members
```
