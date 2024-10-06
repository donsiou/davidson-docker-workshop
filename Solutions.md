# Solutions

## Launch Nginx container

- When you run a container with `docker container run`, Docker will first check if the image is available locally, if not, it will pull the image from the registry.

```bash
docker container run nginx:latest
# OR
docker container run nginx
```

## Run Nginx container in detached mode

- To run the container in detached mode, use the `-d` option

```bash
docker container run -d nginx:latest
# OR
docker container run -d nginx
```

## Clean up the running nginx container

- To stop the running container, use the `docker container stop` command

```bash
# Stop and remove the container
docker container stop my-nginx
docker container rm my-nginx

# Verify that the container has been removed
docker container ls -a
# You should not see the container in the list
```

## nginx version 1.27.2-alpine

```bash
# Run the container with the tag 1.27.2-alpine
docker container run --name my-nginx -d -p 8080:80 nginx:1.27.2-alpine
```

- Go to http://localhost:8080, you should see the Nginx HTML home page

```bash
# Open a shell in the container
docker container exec -it my-nginx /bin/sh
```

## V2.0 Development

- Make changes to [tps/2.0/index.html](tps/2.0/index.html)
- Build a new image with the tag `formation-nginx:2.0`

```bash
export VERSION="2.0"
docker image build -t formation-nginx:$VERSION tps/$VERSION
```

## V2.0 Testing

```bash
export VERSION="2.0"
# Stop and remove the running container
docker container rm -f nginx-dev

# Run the container with the tag 2.0
docker container run --name $VERSION -d -p 8080:80 formation-nginx:$VERSION

# Check if the container is running
docker container ls
```

- Go to http://localhost:8080, you should see the updated HTML page (You may need to refresh the page to see the changes)

## V2.0 Publishing

- Publish the image to Dockerhub

```bash
export DOCKERHUB_USERNAME=<your-dockerhub-username>
docker image tag formation-nginx:2.0 $DOCKERHUB_USERNAME/formation-nginx:2.0
docker image push $DOCKERHUB_USERNAME/formation-nginx:2.0
```


