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


## Customizing your application

### Customizing the container

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

- **Exercice**: 
  - Delete the container and run it again
  - try to access the Nginx HTML home page
  - What happens ? why ?
  
- **Question 12** : How can I persist the changes made in the container ?
- **Exercice**: Delete running nginx container: my-nginx

### Customizing the image

- This is the [Dockerfile](tps/1.0/Dockerfile) to create a custom image with the Nginx HTML home page modified
- **Exercice**: Go to the [Dockerfile](tps/1.0/Dockerfile) and change the Name to your name

- Build the image with the name formation-nginx and tag 1.0
  
```bash
docker image build -t formation-nginx:1.0 tps/1.0
```

- Run the container with the custom image

```bash
docker container run --name my-nginx -d -p 8080:80 formation-nginx:1.0
```

- Go to `http://localhost:8080`, you should see the new HTML home page

- **Question 13** : How can I share the custom image with others ?

### Publishing your custom image

- Create an account on [Dockerhub](https://hub.docker.com/)
- Login to Dockerhub
```bash
docker login docker.io
# Enter your Dockerhub credentials (username and password)
```

- Tag the custom image with your Dockerhub username

```bash
export DOCKERHUB_USERNAME=donsiou
docker image tag formation-nginx:1.0 docker.io/$DOCKERHUB_USERNAME/formation-nginx:1.0
```

- Push the custom image to Dockerhub

```bash
docker image push docker.io/$DOCKERHUB_USERNAME/formation-nginx:1.0
```

- Go to [Dockerhub](https://hub.docker.com/), you should see the custom image



## Developing with Docker

### V2.0: Homepage as a file

**Goal**: Instead of hardcoding the HTML content in the Dockerfile, we will use a file to store the content

- We will use the [COPY](https://docs.docker.com/reference/dockerfile/#copy) instruction to copy [the index.html](tps/2.0/index.html) file to the container in the [Dockerfile](tps/2.0/Dockerfile)

#### V2.0: Development

- **Exercice**: 
  - Go to the file [tps/2.0/index.html](tps/2.0/index.html), and change the Name to your name
  - Create a new image formation-nginx with the tag 2.0
  - Solution : [Solutions](Solutions.md#v20-development)

#### V2.0: Testing

- **Exercice**: 
  - Delete the running container my-nginx
  - Run the container with the new image formation-nginx:2.0 and name nginx-dev
  - Go to `http://localhost:8080`, you should see the new HTML home page
  - Solution : [Solutions](Solutions.md#v20-testing)

#### V2.0: Publishing

- **Exercice**: 
  - Tag the custom image with your Dockerhub username
  - Push the custom image to Dockerhub
  - Solution : [Solutions](Solutions.md#v20-publishing)

- Run the container with the published image from Dockerhub

```bash
# The port 8090 is used to avoid conflict with the previous container 
docker container run --name nginx-prod -d -p 8090:80 $DOCKERHUB_USERNAME/formation-nginx:2.0
```

- Go to `http://localhost:8090`, you should see the new HTML home page

### V3.1: Define the Name with an environment variable

**Goal**: Instead of hardcoding the Name in the index.html file, we will use an environment variable to set the Name

- We will use the [ENV](https://docs.docker.com/reference/dockerfile/#env) instruction to set the Name environment variable in the [Dockerfile](tps/3.1/Dockerfile)
- We will use envsubst to replace the Name in the index.html file
- We will use -e option to set the Name environment variable when running the container

#### V3.1: Development

- **Exercice**: 
  - Modify the [Dockerfile](tps/3.1/Dockerfile) to set the username environment variable
  - Create a new image formation-nginx with the tag 3.1

#### V3.1: Testing

- **Exercice**: 
  - Delete the running container nginx-dev
  - Run the container with the new image formation-nginx:3.1 and name nginx-dev
  - Go to `http://localhost:8080`, you should see the new HTML home page with your name

- You can also set the Name environment variable when running the container

```bash
# Delete the running container nginx-dev
docker container rm -f nginx-dev

# Run the container with the new image formation-nginx:3.1 and name nginx-dev
docker container run --name nginx-dev -d -p 8080:80 -e username=Davidson formation-nginx:3.1
```

- Go to `http://localhost:8080`

- **Question**: Why the provided value is not displayed in the HTML page ?
- **Question**: How can I fix this ?

### V3.2: Dynamic content with entrypoint

**Goal**: In order to define the Name dynamically, The HTML template must be rendred in the runtime, and not in the build time, we will achive this by modifying the entrypoint script

- We will use the [ENTRYPOINT](https://docs.docker.com/reference/dockerfile/#entrypoint) and  [CMD](https://docs.docker.com/reference/dockerfile/#cmd) instructions to run the entrypoint script in the [Dockerfile](tps/3.2/Dockerfile)

#### V3.2: Development

- **Exercice**: 
  - Modify the [Dockerfile](tps/3.2/Dockerfile) to set the username environment variable
  - Modify the [entrypoint.sh](tps/3.2/entrypoint.sh) to add a message with the your name
  - Create a new image formation-nginx with the tag 3.2
  
#### V3.2: Testing

- Run the container with the new image and define environment variable username

```bash
# Delete the running container nginx-dev
docker container rm -f nginx-dev

# Run the container with the new image formation-nginx:3.2 and name nginx-dev
docker container run --name nginx-dev -d -p 8080:80 -e username=Davidson formation-nginx:3.2

# Check the logs of the container to see your custom message
docker container logs nginx-dev

# You should see the message with your name
```

- Go to `http://localhost:8080`, you should see the HTML home page with the environment variable value you provided

