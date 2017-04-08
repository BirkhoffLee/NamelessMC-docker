# NamelessMC-docker
The Docker-Compose file and container Dockerfiles for the NamelessMC project. This project is currently supporting [NamelessMC v1.0.15](https://github.com/NamelessMC/Nameless/tree/v1.0.15).

# Deployment
You have to manually install Docker first if you don't have it installed on your server. Check out the official install guide here: https://docs.docker.com/engine/installation.

If you want to specify the version of NamelessMC you want to run, please head to https://github.com/BirkhoffLee/NamelessMC-docker#manually-run-commands.

## Using docker-compose (automated)
For this method of deploying, you will need to install `docker-compose` for quick deploying, if you don't have it:
```
$ curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose
```

> Note: If you get a “Permission denied” error while running the commands above, please add `sudo` at the start of them and run again. This will require sudo access.

When you're done, clone this repository and run! (`-d` means detach mode, e.g. run in background)
```
$ git clone https://github.com/BirkhoffLee/NamelessMC-docker
$ cd NamelessMC-docker
$ docker-compose up -d
```

By default, the NamelessMC will then running on `0.0.0.0:80`! Open `http://<your-server-ip-address>` on your browser. Instead, if you're trying on your personal computer, open `http://localhost` then.

## Manually run commands
If you more like to run the containers by yourself or using them with other containers like [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy), you may want to do it yourself.

First, clone this repository:

```
$ git clone https://github.com/BirkhoffLee/NamelessMC-docker
$ cd NamelessMC-docker
```

Next, let's build the NamelessMC Apache server image.

```
$ docker build -t namelessmc .
```

If you want to specify the version:

```
$ docker build --build-arg NAMELESSMC_VERSION=1.0.15 -t namelessmc .
```

The version number **MUST BE** listed [here](https://github.com/NamelessMC/Nameless/releases) and it's **not guranteed** to work.

Next, run the image we just built and a MySQL container as well.

```
$ docker run -d -e "MYSQL_ROOT_PASSWORD=nameless" -e "MYSQL_USER=nameless" -e "MYSQL_PASSWORD=nameless" -e "MYSQL_DATABASE=nameless" --name nameless_db mysql
$ docker run -d -p 80:80 --link nameless_db --name nameless namelessmc
```

That's it!

# NamelessMC Installation
After deploying the containers, open the corresponding url in your web browser to get started with NamelessMC.

In my case, I'm not upgrading from 0.4.1 but doing a fresh install, I chose *"No, this is a new install >>"*.

Then it will show up a page about the geeky requirements, they should have been prepared during the build process, so let's click *"Proceed >>"*.

Next, the database configuration page will show up. For the database address, please fill `nameless_db` into it.

For the rest information, please fill the following details into the corresponding fields on the page, if you used the default database configuration during deployment:

> Database Username: `nameless`  
  Database Password: `nameless`  
  Database Name: `nameless`

Click *"Submit"*, the page should tell *"The database was initialised successfully, and you may now progress with the installation."*. Otherwise, please check your database information you typed in.

Press *"Continue >>"*, complete the rest of configuration, and you're ready.
