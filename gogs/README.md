Dockerfile <https://github.com/hkloudou/dockerfiles/tree/master/gogs>

Automatically built by Github Actions

#### Creating an instance:

    docker run \
        -d \
        --name gogs \
        -p 3000:3000 \
        -p 22:22 \
        hkloudou/gogs:0.12.4