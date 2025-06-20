## Launch Nginx container

- When you run a container with `docker container run`, Docker will first check if the image is available locally, if not, it will pull the image from the registry.

```bash
docker container run nginx:latest
# OR
docker container run nginx
```