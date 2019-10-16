#!/bin/bash

DOCKER_REGISTRY=PRIVATE_REGISTRY_ENDPOINT

docker tag cdn-ops-db $DOCKER_REGISTRY/cdn-ops-db
docker push $DOCKER_REGISTRY/cdn-ops-db
docker tag cdn-enroller $DOCKER_REGISTRY/cdn-enroller
docker push $DOCKER_REGISTRY/cdn-enroller
docker tag cdn-ops-perl $DOCKER_REGISTRY/cdn-ops-perl
docker push $DOCKER_REGISTRY/cdn-ops-perl
docker tag cdn-ops-go $DOCKER_REGISTRY/cdn-ops-go
docker push $DOCKER_REGISTRY/cdn-ops-go
docker tag cdn-stats $DOCKER_REGISTRY/cdn-stats
docker push $DOCKER_REGISTRY/cdn-stats
docker tag cdn-portal $DOCKER_REGISTRY/cdn-portal
docker push $DOCKER_REGISTRY/cdn-portal
docker tag cdn-router $DOCKER_REGISTRY/cdn-router
docker push $DOCKER_REGISTRY/cdn-router
docker tag cdn-monitor $DOCKER_REGISTRY/cdn-monitor
docker push $DOCKER_REGISTRY/cdn-monitor
docker tag cdn-service-server $DOCKER_REGISTRY/cdn-service-server
docker push $DOCKER_REGISTRY/cdn-service-server
docker tag cdn-vault $DOCKER_REGISTRY/cdn-vault
docker push $DOCKER_REGISTRY/cdn-vault
docker tag cdn-db $DOCKER_REGISTRY/cdn-db
docker push $DOCKER_REGISTRY/cdn-db
docker tag cdn-edge-tier $DOCKER_REGISTRY/cdn-edge-tier
docker push $DOCKER_REGISTRY/cdn-edge-tier
docker tag cdn-dns $DOCKER_REGISTRY/cdn-dns
docker push $DOCKER_REGISTRY/cdn-dns
docker tag cdn-mid-tier $DOCKER_REGISTRY/cdn-mid-tier
docker push $DOCKER_REGISTRY/cdn-mid-tier
