# Docker_Swarm

## Initializing the Docker Swarm


### 1) Making the machine as master

```
sudo docker swarm init --advertise-addr <master_node_public_ip_address>
```

Doing this would give us a token
Entering this token in the other machines would make them worker for this particular master

### 2) On the worker node we enter the token

```
docker swarm join --token <token>
```
This will make the node part of the swarm


### 3)Testing the connection

```
docker node ls
```

### 4) Creating an image using Dockerfile

```
vi Dockerfile
```
Inside the Dockerfile

```
FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get clean
EXPOSE 80
```


Building the Image with tagname myserver
```
sudo docker build -t myserver .
```
Checking the newly created docker image
```
sudo docker images
```

### 5)Pushing the image to Remote repo

Since the images are in the local storage they won't be accessible to other nodes.
So we need to push the image to the remote repository.
For this I am using my private repository.

```
sudo docker push prithvi107/myserver
```

### 6)Running the container on all the nodes

```
sudo docker service create --name web-service --replicas 2 -p 80:80 prithvi107/myserver
```

### 7)Testing the Swarm

Checking if the container is running the worker node

```
sudo docker ps
```

Deleting a container to see if it regenerates

```
sudo docker rm -f <container_id>
```
### 8)To Stop the service

```
sudo docker service rm <service_name>
```



