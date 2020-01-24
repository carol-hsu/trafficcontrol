#!/bin/bash

DOCKER_REGISTRY=gabbro:30500
#PRIVATE_REGISTRY_ENDPOINT
TAG=0.1

docker tag cdn-ops-db $DOCKER_REGISTRY/cdn-ops-db:$TAG
docker push $DOCKER_REGISTRY/cdn-ops-db:$TAG
docker tag cdn-enroller $DOCKER_REGISTRY/cdn-enroller:$TAG
docker push $DOCKER_REGISTRY/cdn-enroller:$TAG
docker tag cdn-ops-perl $DOCKER_REGISTRY/cdn-ops-perl:$TAG
docker push $DOCKER_REGISTRY/cdn-ops-perl:$TAG
docker tag cdn-ops-go $DOCKER_REGISTRY/cdn-ops-go:$TAG
docker push $DOCKER_REGISTRY/cdn-ops-go:$TAG
docker tag cdn-stats $DOCKER_REGISTRY/cdn-stats:$TAG
docker push $DOCKER_REGISTRY/cdn-stats:$TAG
docker tag cdn-router $DOCKER_REGISTRY/cdn-router:$TAG
docker push $DOCKER_REGISTRY/cdn-router:$TAG
docker tag cdn-monitor $DOCKER_REGISTRY/cdn-monitor:$TAG
docker push $DOCKER_REGISTRY/cdn-monitor:$TAG
docker tag cdn-service-server $DOCKER_REGISTRY/cdn-service-server:$TAG
docker push $DOCKER_REGISTRY/cdn-service-server:$TAG
docker tag cdn-vault $DOCKER_REGISTRY/cdn-vault:$TAG
docker push $DOCKER_REGISTRY/cdn-vault:$TAG
docker tag cdn-stat-db $DOCKER_REGISTRY/cdn-stat-db:$TAG
docker push $DOCKER_REGISTRY/cdn-stat-db:$TAG
docker tag cdn-edge-tier $DOCKER_REGISTRY/cdn-edge-tier:$TAG
docker push $DOCKER_REGISTRY/cdn-edge-tier:$TAG
docker tag cdn-mid-tier $DOCKER_REGISTRY/cdn-mid-tier:$TAG
docker push $DOCKER_REGISTRY/cdn-mid-tier:$TAG
