# Jenkins Image

## Create Jenkins Image

- Tạo Dockerfile

```bash
touch Dockerfile
```

-Paste nội dung bên dưới vào Dockerfile

```Dockerfile
FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release wget
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
RUN wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz \
 && mkdir -p /usr/lib/jvm \
 && tar -xvzf ./openjdk-17_linux-x64_bin.tar.gz \
 && mv jdk-17 /usr/lib/jvm/jdk-17
ENV PATH "/usr/lib/jvm/jdk-17:$PATH"
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
```

- Thực hiện build Dockerfile

```bash
docker build -t kairos-jenkins:1.0.0 .
```
 
- Push Image Dockerfile to Docker hub

```bash
docker tag kairos-jenkins:1.0.0 huynhtamhao/kairos-jenkins:1.0.0
docker push huynhtamhao/kairos-jenkins:1.0.0
```

