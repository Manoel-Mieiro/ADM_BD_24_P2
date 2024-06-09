#!/bin/bash

function build(){
    docker compose --compatibility --project-name "postgresql-temboard" build --memory 1g --no-cache;
}

function up(){
    docker compose --compatibility --project-name "postgresql-temboard" up -d;
}

function stop(){
    docker compose --compatibility --project-name "postgresql-temboard" stop;
}

function restart(){
    docker compose --compatibility --project-name "postgresql-temboard" down && \
    docker compose --compatibility --project-name "postgresql-temboard" up -d;
}

function drop(){
    docker compose --compatibility --project-name "postgresql-temboard" down;
}

function drop_hard(){
    docker compose --compatibility --project-name "postgresql-temboard" down --remove-orphans --volumes --rmi 'all' && \
    docker builder prune -f;
}

function addServers(){
    COMMAND='sudo -u ${POSTGRES_USER} temboard-agent -c /etc/temboard-agent/data/pgdata/temboard-agent.conf register --groups default';
    docker exec -it postgres12 bash -c "$(echo $COMMAND)";
    docker exec -it postgres13 bash -c "$(echo $COMMAND)";
    docker exec -it postgres14 bash -c "$(echo $COMMAND)";
}

$1
