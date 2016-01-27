# Create Consul Cluster on Docker

[consul](https://www.consul.io) on [docker](https://www.docker.com/)

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

## Join cluster

ex) add server3 to server1 cluster

```
docker exec -it $(docker ps -q -f name=server3) consul join c3d_server1.docker
```

## DNS

use DNS for two-way access of container each other

see [tonistiigi/dnsdock](https://github.com/tonistiigi/dnsdock)
