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