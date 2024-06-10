#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    CREATE USER superset WITH PASSWORD 'superset';
    CREATE DATABASE superset;
    GRANT ALL PRIVILEGES ON DATABASE superset TO superset;
EOSQL