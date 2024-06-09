# Dockerfile

# Temboard
FROM postgres:14-bullseye AS temboard

ARG TEMBOARD_VERSION

# Repositorio interno
ENV PGPORT "5432"
ENV POSTGRES_PASSWORD "temboard"
ENV POSTGRES_USER "postgres"
ENV POSTGRES_DB "temboard"
ENV PGDATA "/var/lib/postgresql/data/pgdata"
ENV POSTGRES_NAME "temboard"

# Monitor
ENV PGUSER=postgres
ENV PGHOST=localhost
ENV LOGDIR=/home/temboard/log/temboard
ENV LOGFILE=/home/temboard/log/temboard/temboard-auto-configure.log
ENV ETCDIR=/home/temboard/etc
ENV VARDIR=/home/temboard/bin
ENV SYSUSER=root
ENV TEMBOARD_PORT=8888
ENV TEMBOARD_PASSWORD=temboard
ENV TEMBOARD_DATABASE=temboard
ENV TEMBOARD_LOGGING_LEVEL=INFO
ENV TEMBOARD_VERSION ${TEMBOARD_VERSION}

WORKDIR /home/temboard

RUN apt-get update -y && \
    apt-get install -y sudo python3-pip locales; \
	whereis python3 && ln -s /usr/bin/python3 /usr/bin/python && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8;

ENV LANG en_US.utf8
ENV TZ America/Bahia

COPY ./Temboard/db-config.sh /docker-entrypoint-initdb.d/

COPY ./Temboard/docker-entrypoint.sh /home/temboard/

RUN chmod +x /home/temboard/docker-entrypoint.sh

RUN mkdir -p /home/temboard/log/temboard; \
	mkdir -p /home/temboard/etc; \
	mkdir -p /home/temboard/bin; \
	echo '' > /home/temboard/log/temboard/temboard-auto-configure.log; \
	pip install temboard==${TEMBOARD_VERSION} psycopg2-binary && temboard --version;

ENTRYPOINT ["/home/temboard/docker-entrypoint.sh"]














# Postgres
FROM postgres:12-bullseye AS postgres12

ARG TEMBOARD_AGENT_VERSION

WORKDIR /var/lib/postgresql/data

# Postgres
ENV PGDATA "/var/lib/postgresql/data/pgdata"
ENV PGPORT "5432"
ENV POSTGRES_PASSWORD "postgres12"
ENV POSTGRES_USER "postgres"
ENV POSTGRES_DB "postgres12"
ENV POSTGRES_NAME "postgres12"

# Temboard Agent
ENV TEMBOARD_AGENT_VERSION ${TEMBOARD_AGENT_VERSION}
ENV TEMBOARD_PORT "2345"
ENV PGUSER ${POSTGRES_USER}
ENV PGPASSWORD ${POSTGRES_PASSWORD}
ENV PGDATABASE ${POSTGRES_DB}
ENV PGHOST /var/run/postgresql
ENV TEMBOARD_HOSTNAME "producao.postgres12"

RUN apt-get update -y && \
    apt-get install -y \
	sudo build-essential \
    libncursesw5-dev \
    libxml2-dev \
    libgdal-dev \
    libproj-dev \
    libjson-c-dev \
    xsltproc \
    docbook-xsl \
    docbook-mathml \
    libpq-dev \
    protobuf-c-compiler \
    libjsoncpp-dev \
    libprotobuf-dev \
    libprotobuf-c-dev \
    proj-bin \
    python3-pip python3-setuptools python3-dev; \
	whereis python3 && ln -s /usr/bin/python3 /usr/bin/python && \
	pip install logutils argparse psycopg2 temboard-agent==${TEMBOARD_AGENT_VERSION};

COPY ./Postgres/db-config.sh /docker-entrypoint-initdb.d/

# Custom entrypoint
COPY ./Postgres/custom-docker-entrypoint.sh /var/lib/postgresql/data
RUN chmod +x /var/lib/postgresql/data/custom-docker-entrypoint.sh


ENTRYPOINT ["/var/lib/postgresql/data/custom-docker-entrypoint.sh"]














# Postgres
FROM postgres:13-bullseye AS postgres13

ARG TEMBOARD_AGENT_VERSION

WORKDIR /var/lib/postgresql/data

# Postgres
ENV PGDATA "/var/lib/postgresql/data/pgdata"
ENV PGPORT "5432"
ENV POSTGRES_PASSWORD "postgres13"
ENV POSTGRES_USER "postgres"
ENV POSTGRES_DB "postgres13"
ENV POSTGRES_NAME "postgres13"

# Temboard Agent
ENV TEMBOARD_AGENT_VERSION ${TEMBOARD_AGENT_VERSION}
ENV TEMBOARD_PORT "2345"
ENV PGUSER ${POSTGRES_USER}
ENV PGPASSWORD ${POSTGRES_PASSWORD}
ENV PGDATABASE ${POSTGRES_DB}
ENV PGHOST /var/run/postgresql
ENV TEMBOARD_HOSTNAME "producao.postgres13"

RUN apt-get update -y && \
    apt-get install -y \
	sudo build-essential \
    libncursesw5-dev \
    libxml2-dev \
    libgdal-dev \
    libproj-dev \
    libjson-c-dev \
    xsltproc \
    docbook-xsl \
    docbook-mathml \
    libpq-dev \
    protobuf-c-compiler \
    libjsoncpp-dev \
    libprotobuf-dev \
    libprotobuf-c-dev \
    proj-bin \
    python3-pip python3-setuptools python3-dev; \
	whereis python3 && ln -s /usr/bin/python3 /usr/bin/python && \
	pip install logutils argparse psycopg2 temboard-agent==${TEMBOARD_AGENT_VERSION};

COPY ./Postgres/db-config.sh /docker-entrypoint-initdb.d/

# Custom entrypoint
COPY ./Postgres/custom-docker-entrypoint.sh /var/lib/postgresql/data
RUN chmod +x /var/lib/postgresql/data/custom-docker-entrypoint.sh


ENTRYPOINT ["/var/lib/postgresql/data/custom-docker-entrypoint.sh"]














# Postgres
FROM postgres:14-bullseye AS postgres14

ARG TEMBOARD_AGENT_VERSION

WORKDIR /var/lib/postgresql/data

# Postgres
ENV PGDATA "/var/lib/postgresql/data/pgdata"
ENV PGPORT "5432"
ENV POSTGRES_PASSWORD "postgres14"
ENV POSTGRES_USER "postgres"
ENV POSTGRES_DB "postgres14"
ENV POSTGRES_NAME "postgres14"

# Temboard Agent
ENV TEMBOARD_AGENT_VERSION ${TEMBOARD_AGENT_VERSION}
ENV TEMBOARD_PORT "2345"
ENV PGUSER ${POSTGRES_USER}
ENV PGPASSWORD ${POSTGRES_PASSWORD}
ENV PGDATABASE ${POSTGRES_DB}
ENV PGHOST /var/run/postgresql
ENV TEMBOARD_HOSTNAME "producao.postgres14"

RUN apt-get update -y && \
    apt-get install -y \
	sudo build-essential \
    libncursesw5-dev \
    libxml2-dev \
    libgdal-dev \
    libproj-dev \
    libjson-c-dev \
    xsltproc \
    docbook-xsl \
    docbook-mathml \
    libpq-dev \
    protobuf-c-compiler \
    libjsoncpp-dev \
    libprotobuf-dev \
    libprotobuf-c-dev \
    proj-bin \
    python3-pip python3-setuptools python3-dev; \
	whereis python3 && ln -s /usr/bin/python3 /usr/bin/python && \
	pip install logutils argparse psycopg2 temboard-agent==${TEMBOARD_AGENT_VERSION};

COPY ./Postgres/db-config.sh /docker-entrypoint-initdb.d/

# Custom entrypoint
COPY ./Postgres/custom-docker-entrypoint.sh /var/lib/postgresql/data
RUN chmod +x /var/lib/postgresql/data/custom-docker-entrypoint.sh


ENTRYPOINT ["/var/lib/postgresql/data/custom-docker-entrypoint.sh"]


# Postgres
FROM postgres:14 AS postgres-source-db

ARG TEMBOARD_AGENT_VERSION

WORKDIR /var/lib/postgresql/data

# Postgres
ENV PGDATA "/var/lib/postgresql/data/pgdata"
ENV PGPORT "5432"
ENV POSTGRES_PASSWORD "senha"
ENV POSTGRES_USER "dbadmin"
ENV POSTGRES_DB "db"
ENV POSTGRES_NAME "postgres-source-db"

# Temboard Agent
ENV TEMBOARD_AGENT_VERSION ${TEMBOARD_AGENT_VERSION}
ENV TEMBOARD_PORT "2345"
ENV PGUSER ${POSTGRES_USER}
ENV PGPASSWORD ${POSTGRES_PASSWORD}
ENV PGDATABASE ${POSTGRES_DB}
ENV PGHOST /var/run/postgresql
ENV TEMBOARD_HOSTNAME "mf.sales.db"

RUN apt-get update -y && \
    apt-get install -y \
	sudo build-essential \
    libncursesw5-dev \
    libxml2-dev \
    libgdal-dev \
    libproj-dev \
    libjson-c-dev \
    xsltproc \
    docbook-xsl \
    docbook-mathml \
    libpq-dev \
    protobuf-c-compiler \
    libjsoncpp-dev \
    libprotobuf-dev \
    libprotobuf-c-dev \
    proj-bin \
    python3-pip python3-setuptools python3-dev; \
	whereis python3 && ln -s /usr/bin/python3 /usr/bin/python && \
	pip install logutils argparse psycopg2 temboard-agent==${TEMBOARD_AGENT_VERSION};

COPY ./Postgres/db-config.sh /docker-entrypoint-initdb.d/

# Custom entrypoint
COPY ./Postgres/custom-docker-entrypoint.sh /var/lib/postgresql/data
RUN chmod +x /var/lib/postgresql/data/custom-docker-entrypoint.sh


ENTRYPOINT ["/var/lib/postgresql/data/custom-docker-entrypoint.sh"]


