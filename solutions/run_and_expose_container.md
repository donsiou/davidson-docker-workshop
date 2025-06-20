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