# Readme

## Build & start containers

```bash
docker compose -f docker-compose.yml build
docker compose -f docker-compose.yml up
```

or

```bash
docker compose -f docker-compose.yml up --build
```

start up and detach

```bash
docker compose -f docker-compose.yml up -d --build
```

## Stop & remove containers

```bash
docker compose -f docker-compose.yml down
```

also remove volumes

```bash
docker compose -f docker-compose.yml down --volumes
```

## Remove images

```bash
docker rmi $(docker images -q)
```

## Ref

- <https://github.com/leangaurav/nginx_https_docker>
- <https://mpolinowski.github.io/docs/DevOps/NGINX/2020-08-26--nginx-docker-setup/2020-08-26/#etcnginxnginxconf>
- <https://github.com/MartinKaburu/docker-postgresql-multiple-databases>
- <https://hub.docker.com/r/ntninja/wordpress-postgresql>
