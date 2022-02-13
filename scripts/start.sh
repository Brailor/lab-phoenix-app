#!/bin/bash

docker compose down

PQ_CONTAINER_NAME="lab-phoenix-app-db-1"
# start up docker compose first with the db
echo "staring Postgres database..."
docker compose up -d

timeout 90s bash -c "until docker exec $PQ_CONTAINER_NAME pg_isready ; do sleep 5 ; done"

source .env

# start up the elixir application
POSTGRES_USER=$POSTGRES_USER \
    POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
    mix phx.server