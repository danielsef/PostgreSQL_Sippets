FROM postgres:10.7
COPY init.sql /docker-entrypoint-initdb.d/
