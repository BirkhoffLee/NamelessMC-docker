# NamelessMC-docker
The Docker-Compose file and container Dockerfiles for the NamelessMC project. This project is currently supporting [NamelessMC v1.0.15](https://github.com/NamelessMC/Nameless/tree/v1.0.15).

# Usage
You have to manually install Docker first if you don't have it installed on your server. Check out the official install guide here: https://docs.docker.com/engine/installation.

After getting Docker ready, you will need to install `docker-compose` for quick deploying:
```
$ curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

When you're done, clone this repository and run! (`-d` means detach mode, e.g. run in background)
```
$ git clone https://github.com/BirkhoffLee/NamelessMC-docker
$ cd NamelessMC-docker
$ docker-compose up -d
```

The NamelessMC will then running on `0.0.0.0:80`! Open `http://<your-server-ip-address>` on your browser. Instead, if you're trying on your personal computer, open `http://localhost` then.
