# Docusaurus SSH Docker

Docker image with Docusaurus that can be managed with SSH

<img src="https://raw.githubusercontent.com/wiktormalyska/docusaurus-docker-ssh/refs/heads/master/img/view.png" />

## ⭐ Features
- Connection with SSH
- Edited files are rebuild in live
- Compatible with [code-server](https://github.com/coder/code-server)


## 🔧 How to Install using docker run

Requirements:
- Docker

### Installation:
- run command `docker run -d -p 3000:3000 -p 22:22 --name docusaurus-ssh pmalys/docusaurus-ssh`
  - you can change root password by adding `--build-arg ROOT_PASSWORD=your_password` to `docker run` command

## 🔧 How to Install using docker compose

Requirements:
- Docker

### Installation:
- create file `docker-compose.yml` in desired localization
- paste this code into `docker-compose.yml` file:
```yml
services:
  docusaurus:
    container_name: docusaurus
    image: pmalys/docusaurus-ssh
    environment:
      ROOT_PASSWORD: root
    volumes:
      - docusaurus_home:/home
volumes:
  docusaurus_home: null

```
- (optional) change your password in `args:` for example `ROOT_PASSWORD=your_password`
- run with `docker compose up -d`

## How to use
- On port `3000` you will have Docusaurus website
- On port `22` you will have ssh
  - to connect to ssh use `ssh root@localhost -p 22`
  - when prompted for password write `root` when not changed
