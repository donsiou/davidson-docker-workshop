## V2.0 Testing

```bash
export VERSION="2.0"
# Stop and remove the running container
docker container rm -f my-nginx

# Run the container with the tag 2.0
docker container run --name my-nginx -d -p 8080:80 formation-nginx:$VERSION

# Check if the container is running
docker container ls
```

- Go to http://localhost:8080, you should see the updated HTML page (You may need to refresh the page to see the changes)