--creating database with docker to use with postgres
docker run -it \
    -e POSTGRES_USER="root" \
    -e POSTGRES_PASSWORD="root" \
    -e POSTGRES_DB="ny_taxi" \
    -v ny_taxi_postgres_data:/workspaces/DE2025/ModuleOne/docker_sql/ny_taxi_postgres_data \
    -p 5432:5432 \
    postgres:13

--creating the postgress enviornment on local host
pgcli -h localhost -p 5432 -u root -d ny_taxi

--using pg admin

docker run -it \
    -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
    -e PGADMIN_DEFAULT_PASSWORD="root" \
    -p 8080:80 \
    dpage/pgadmin4

--creating a network to link pgadmin and postgres db 
docker network create pg-network

--creating a network

docker network create pg-network

docker run -it \
    -e POSTGRES_USER="root" \
    -e POSTGRES_PASSWORD="root" \
    -e POSTGRES_DB="ny_taxi" \
    -v ny_taxi_postgres_data:/workspaces/DE2025/ModuleOne/docker_sql/ny_taxi_postgres_data \
    -p 5432:5432 \
    --network=pg-network \
    --name pg-database \
    postgres:13

--Now to run pgadmin in same network
docker run -it \
    -e PGADMIN_DEFAULT_EMAIL="admin@admin.com" \
    -e PGADMIN_DEFAULT_PASSWORD="root" \
    -p 8080:80 \
    --network=pg-network \
    --name pgadmin \
    dpage/pgadmin4
    
