#!bin/bash

build(){
    docker compose --compatibility --project-name "nifi" build --no-cache -m 1g
}

up(){
    docker compose --compatibility --project-name "nifi" up -d
}

stop(){
    docker compose --compatibility --project-name "nifi" stop
}

restart(){
    docker compose --compatibility --project-name "nifi" down && \
    docker compose --compatibility --project-name "nifi" up -d
}

drop(){
    docker compose --compatibility --project-name "nifi" down
}

drop_hard(){
    docker compose --compatibility --project-name "nifi" down --remove-orphans --volumes --rmi 'all' && \
    docker builder prune -f
}

# Acessar com http://localhost:8081/nifi
# OU
# Acessar com http://localhost:8443/nifi usuario: admin senha: admin

$1