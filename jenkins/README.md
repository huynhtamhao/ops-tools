# Install 

## Build image trong thư mục build-image trước

## Install Jenkins

- Copy nội dung file daemon/daemon.json vào /etc/docker/daemon.json
restart docker

```bash
sudo service docker restart
```

- Install

```bash
mkdir jenkins_docker_certs jenkins_home
docker-compose up --build -d
// OR
sh install.sh
```


