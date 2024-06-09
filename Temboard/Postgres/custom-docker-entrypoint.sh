#!/bin/bash
set -e

function runTemboardAgente {
	if [ ! -f "/var/lib/postgresql/data/configured" ]
	then
		/usr/local/share/temboard-agent/purge.sh data/pgdata;
		/usr/local/share/temboard-agent/auto_configure.sh http://temboard:8888;
		sudo -u ${POSTGRES_USER} temboard-agent -c /etc/temboard-agent/data/pgdata/temboard-agent.conf fetch-key --force;
	else
		echo "Temboard Agente Configured"
	fi;
    sudo -u ${POSTGRES_USER} temboard-agent -c /etc/temboard-agent/data/pgdata/temboard-agent.conf;
}

function customize {
	sleep 30 && runTemboardAgente &
}

customize & /usr/local/bin/docker-entrypoint.sh "$@"

