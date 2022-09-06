# Running Quorum in a Single Docker Container

Fast bootable Quorum container for testing.

## Usage
```
docker run -d -p 8545:8545 -p 8546:8546 -p 8547:8547  -p 30303:30303 -p 5040:5040 --name quorum fox0430/quorum:latest
```

DockerHub: https://hub.docker.com/r/fox0430/quorum

## Aditional Information
Included wallet password: Xv4kx)2(Z$gg

## Reference
https://github.com/cladular/quorum-docker-single-container
