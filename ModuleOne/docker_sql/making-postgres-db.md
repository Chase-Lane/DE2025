creating database with docker to use with postgres
docker run -it \
    -e POSTGRES_USER="root" \
    -e POSTGRES_PASSWORD="root" \
    -e POSTGRES_DB="ny_taxi" \
    -v ny_taxi_postgres_data:/workspaces/DE2025/ModuleOne/docker_sql/ny_taxi_postgres_data \
    -p 5432:5432 \
    postgres:13

creating the postgress enviornment on local host
pgcli -h localhost -p 5432 -u root -d ny_taxi
    