#!/bin/bash

DOCKER_REGISTRY=gabbro:30500

docker pull $DOCKER_REGISTRY/cdn-ops-db
docker pull $DOCKER_REGISTRY/cdn-enroller
docker pull $DOCKER_REGISTRY/cdn-ops-perl
docker pull $DOCKER_REGISTRY/cdn-ops-go
docker pull $DOCKER_REGISTRY/cdn-stats
#docker pull $DOCKER_REGISTRY/cdn-portal
docker pull $DOCKER_REGISTRY/cdn-router
docker pull $DOCKER_REGISTRY/cdn-monitor
docker pull $DOCKER_REGISTRY/cdn-service-server
docker pull $DOCKER_REGISTRY/cdn-vault
docker pull $DOCKER_REGISTRY/cdn-db
docker pull $DOCKER_REGISTRY/cdn-edge-tier
#docker pull $DOCKER_REGISTRY/cdn-dns
docker pull $DOCKER_REGISTRY/cdn-mid-tier
