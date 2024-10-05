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


