#!/bin/bash

DOCKER_REGISTRY=gabbro:30500
#PRIVATE_REGISTRY_ENDPOINT
OLD_TAG=cps
TAG=cps-0.1

docker tag cdn-dns:$OLD_TAG $DOCKER_REGISTRY/cdn-dns:$TAG
docker push $DOCKER_REGISTRY/cdn-dns:$TAG
docker tag cdn-ops-db:$OLD_TAG $DOCKER_REGISTRY/cdn-ops-db:$TAG
docker push $DOCKER_REGISTRY/cdn-ops-db:$TAG
docker tag cdn-enroller:$OLD_TAG $DOCKER_REGISTRY/cdn-enroller:$TAG
docker push $DOCKER_REGISTRY/cdn-enroller:$TAG
docker tag cdn-ops-perl:$OLD_TAG $DOCKER_REGISTRY/cdn-ops-perl:$TAG
docker push $DOCKER_REGISTRY/cdn-ops-perl:$TAG
docker tag cdn-ops-go:$OLD_TAG $DOCKER_REGISTRY/cdn-ops-go:$TAG
docker push $DOCKER_REGISTRY/cdn-ops-go:$TAG
#docker tag cdn-stats:$OLD_TAG $DOCKER_REGISTRY/cdn-stats:$TAG
#docker push $DOCKER_REGISTRY/cdn-stats:$TAG
#docker tag cdn-router:$OLD_TAG $DOCKER_REGISTRY/cdn-router:$TAG
#docker push $DOCKER_REGISTRY/cdn-router:$TAG
#docker tag cdn-monitor:$OLD_TAG $DOCKER_REGISTRY/cdn-monitor:$TAG
#docker push $DOCKER_REGISTRY/cdn-monitor:$TAG
#docker tag cdn-service-server:$OLD_TAG $DOCKER_REGISTRY/cdn-service-server:$TAG
#docker push $DOCKER_REGISTRY/cdn-service-server:$TAG
#docker tag cdn-vault:$OLD_TAG $DOCKER_REGISTRY/cdn-vault:$TAG
#docker push $DOCKER_REGISTRY/cdn-vault:$TAG
#docker tag cdn-stat-db:$OLD_TAG $DOCKER_REGISTRY/cdn-stat-db:$TAG
#docker push $DOCKER_REGISTRY/cdn-stat-db:$TAG
#docker tag cdn-edge-tier:$OLD_TAG $DOCKER_REGISTRY/cdn-edge-tier:$TAG
#docker push $DOCKER_REGISTRY/cdn-edge-tier:$TAG
#docker tag cdn-mid-tier:$OLD_TAG $DOCKER_REGISTRY/cdn-mid-tier:$TAG
#docker push $DOCKER_REGISTRY/cdn-mid-tier:$TAG
