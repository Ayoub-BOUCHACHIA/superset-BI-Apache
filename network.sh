#!/bin/bash
docker network inspect superset_network >/dev/null 2>&1 || \

#!/bin/bash

NETWORK_NAME="superset_network"

# Check if the network exists
if docker network inspect "$NETWORK_NAME" &>/dev/null; then
    echo "The network $NETWORK_NAME exists."
else
    echo "The network $NETWORK_NAME does not exist. Create it ..."

    docker network create superset_network
fi
docker network connect  superset_network superset
docker network connect  superset_network superset_redis
docker network connect  superset_network superset_db

