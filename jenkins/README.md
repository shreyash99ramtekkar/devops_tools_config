# Configuration Steps


# Local Machine 

###  Installing the server on docker

The steps are taken from the below site and run with little modification
https://www.jenkins.io/doc/book/installing/docker/



#### Step 1: Create the docker network 

```bash 
docker network create devops_tools
```
#### step 2: Create the jenkins Volume bind directory

```bash
mkdir /var/tmp/jenkins-data
```

#### Step 3: Run Jenkins inside the docker
```bash
docker run \
  --name jenkins-docker \
  --detach \
  --privileged \
  --network devops_tools \
  --network-alias jenkins-docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume /var/tmp/jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  docker:dind \
  --storage-driver overlay2
```

#### Step 4: Create a Jenkins Docker image

Copy the content to a file
``` bash
FROM jenkins/jenkins:2.462.3-jdk17
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
```

Build the image
```bash
docker build -t myjenkins-blueocean:2.462.3-1 .
```

#### Step 5: Run the customized image
```bash
docker run \
  --name jenkins-blueocean \
  --restart=on-failure \
  --detach \
  --network devops_tools \
  --env DOCKER_HOST=tcp://jenkins-docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client \
  --env DOCKER_TLS_VERIFY=1 \
  --publish 9001:8080 \
  --publish 50000:50000 \
  --volume /var/tmp/jenkins-data:/var/jenkins_home \
  --volume /var/tmp/jenkins-data/jenkins-docker-certs:/certs/client:ro \
  myjenkins-blueocean:2.462.3-1
```

