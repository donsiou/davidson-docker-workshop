## V2.0 Publishing

- Publish the image to Dockerhub

```bash
export DOCKERHUB_USERNAME=<your-dockerhub-username>
docker image tag formation-nginx:2.0 $DOCKERHUB_USERNAME/formation-nginx:2.0
docker image push $DOCKERHUB_USERNAME/formation-nginx:2.0
```