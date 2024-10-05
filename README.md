# Davidson Formation - Docker Workshop
Resources for Davidson Formation workshop


## First container

- Launch your first container

```bash
# Pull the image
docker pull hello-world
```

```bash
# Run the container
docker run hello-world
```

- **Question 1** : Where does the image hello-world come from ?

## Images registries

### Discover Dockerhub

- Go to [Dockerhub](https://hub.docker.com/)
- In the search field (`Search Docker Hub`), type nginx and enter, this will redirect to a new page with a list of choices, example :
  - nginx
  - nginx/nginx-ingress
  - youstin/nginx
  - wodby/nginx
  - ...
  
- **Question 1** : Why the first result (nginx) doesnt have a Preffix (something/nginx) ?
- **Question 2**: Which repository should I use ?

- Choose the first result (nginx) and click on it 
- Go to Tags, you will see a list of tags, example :
  - perl
  - otel
  - latest
  - alpine-slim
- **Question 3** : What is the difference between these tags ?
- **Question 4** : Which tag should I use ?
- **Question 5** : In the docker run in [First container](#first-container) section, we didnt specify tags (hello-world), how does it work ? 

## Containers basics

### Launch Nginx container

- **Exercice** Launch a container with the nginx image and the latest tag
  - Hint : Use the command `docker container run` without pulling the image, what happens ?
  - [Solution](Solutions.md#launch-nginx-container)

- This will block the terminal, to stop the container, use `Ctrl+C`

- Run the container in detached mode
  - Hint : Use the `-d` option ( [Detached mode](https://docs.docker.com/reference/cli/docker/container/run/#detach) )
  - [Solution](Solutions.md#run-nginx-container-in-detached-mode)

- List the running containers

```bash
docker container ls
# Expected output
# CONTAINER ID  IMAGE                           COMMAND               CREATED         STATUS         PORTS       NAMES
# 10c897e29ecc  docker.io/library/nginx:latest  nginx -g daemon o...  28 seconds ago  Up 28 seconds              jovial_hawking
```

- **Question 6**: What is the name of the container ?
- **Question 7**: Why is it a random name ?

- Stop and remove the container

```bash
docker container stop <CHANGE_ME_WITH_CONTAINER_ID>
docker container rm <CHANGE_ME_WITH_CONTAINER_ID>
```

- Run the container with a specific name

```bash
docker container run --name my-nginx -d nginx:latest
```

- **Exercice** : List the running containers and check the name, it should be my-nginx
- **Question 8** : How can I verify that nginx is running ?


### Executing commands in a running container

#### Executing one command

- Run a curl command in the container ([docker container exec](https://docs.docker.com/reference/cli/docker/container/exec/))

```bash
docker container exec my-nginx curl localhost
# Expected output
# Nginx HTML home page
```

#### Executing a shell

- Run a shell in the container

```bash
docker container exec -it my-nginx /bin/sh
```

- Run Commands in the shell

```bash
ls

curl localhost
# Expected output
# Nginx HTML home page

exit
```

- **Question 9** : How can I access Nginx HTML home page from my host ?

#### Port mapping

- **Exercice** : Clean up the running nginx container
  - Stop and remove the running container
  - Verify that the container has been removed
  - [Solution](Solutions.md#clean-up-the-running-nginx-container)
  
- Run the container with the `-p` option to map the port 8080 of the host to the port 80 of the container
  
```bash
docker container run --name my-nginx -d -p 8080:80 nginx:latest
```

- Go to `http://localhost:8080`, you should see the Nginx HTML home page


- **Exercice** : Clean up the running nginx container

- **Question 10** : How can I customize the nginx HTML home page ?


## Customizing containers

### Manual customization

- **Exercice** : nginx version 1.27.2-alpine
  - Search for the nginx image with the tag 1.27.2-alpine on Dockerhub
  - Run the container with the tag 1.27.2-alpine
    - Detach mode
    - Port mapping: 8080:80
    - Name: my-nginx
  - Go to `http://localhost:8080`
  - Open a shell in the container
  - [Solution](Solutions.md#running-an-alpine-container)

-  Modify the Nginx HTML home page

```bash
cd /usr/share/nginx/html
echo "<h1>Hello from Davidson Formation<h1>" > index.html
```

- Go to `http://localhost:8080`, you should see the new HTML home page



