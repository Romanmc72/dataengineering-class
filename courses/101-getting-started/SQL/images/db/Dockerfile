FROM postgres:12.0-alpine
ENV POSTGRES_DB app
COPY ./scripts/db.sql /docker-entrypoint-initdb.d/db.sql
