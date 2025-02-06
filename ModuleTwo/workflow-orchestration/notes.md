# creating a docker container for kestra 
docker compose up -d

  postgres:
    image: postgres
    container_name: postgres-kestr
    environment:
      - POSTGRES_USER=root
      - POSTGRES_PASSWORD=root
      - POSTGRES_DB=green_yellow_taxi
    ports:
      - "5432:5432"
    volumes:
      - "./ny_taxi_postgres_data:/workspaces/DE2025/ModuleTwo/workflow-orchestration/ny_taxi_postgres_data:rw"

  pgadmin:
    image: dpage/pgadmin4
    environment:
      - PGADMIN_DEFAULT_EMAIL=admin@admin.com
      - PGADMIN_DEFAULT_PASSWORD=root
    ports:
      - "8081:80"
    extra_hosts:
      - "host.docker.internal:host-gateway"
# For kestra to work with dbt had to use the ipaddres of postgres
    # found by running: docker inspect postgres-kestr | grep '"IPAddress"'
    # verify unique ids working by running same data set upload multiple times 