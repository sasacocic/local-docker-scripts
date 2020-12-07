#!/bin/bash
CONTAINERID=$(docker ps -q --filter="label=postgres-db-local-unique")

echo "connecting to docker container with id: $CONTAINERID" 

# should probably check if more than 1 exists. Don't want to connect to some random one

docker exec -it $CONTAINERID bash -c "psql --user=me"
