--------------------------------------------------------------------------------
# docker

# images
## build image from Dockerfile
```
docker build -t image-name:latest .
```

## list images
```
docker images
```

## remove images
```
docker rmi image-name:latest
```

# containers
## start a container
```
docker run image-name:latest
docker run --name container-name -d -p 8000:5000 --rm image-name:latest
docker run --name microblog -d --rm \
  -p 8000:5000 \
  -e SECRET_KEY=my-secret-key \
  -e MAIL_SERVER=smtp.googlemail.com \
  -e MAIL_PORT=587 \
  -e MAIL_USE_TLS=true \
  -e MAIL_USERNAME=<your-gmail-username> \
  -e MAIL_PASSWORD=<your-gmail-password> \
  microblog:latest
```

## list containers
```
docker ps
docker container ls
docker container ls --all
```

## stop container
```
docker stop c373b69c095f
```

## remove container
```
docker rm c373b69c095f
```
