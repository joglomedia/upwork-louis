# Readme

## Build & start up

```bash
docker compose -f docker-compose.yml build
docker compose -f docker-compose.yml up
```

## Stop & remove

```bash
docker compose -f docker-compose.yml down
```

## Remove images

```bash
docker rmi $(docker images -q)
```
