#!/bin/bash

# look at the set documentation to make this script more sane. I'm too lazy rn
# ensure uniqueness by removing all instances of the label
echo "Checking if any old postgres docker containers for local development exist."
# docker rm requires at least 1 argument. If no id is returned it complains TODO: fix this
CONTAINER=$(docker ps -qa --filter="label=postgres-db-local-unique")
if [ ! -z "$CONTAINER" ]; then
  echo "We found some! Getting rid of em!!"
  docker rm $CONTAINER
fi
# run a postgresql database locally 
echo "starting local postgres database"
docker run --label="postgres-db-local-unique" -p 5432:5432 -e POSTGRES_PASSWORD=mypass -e POSTGRES_USER=me -e POSTGRES_DB=me postgres 
