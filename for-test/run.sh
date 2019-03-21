# Build docker image
docker build -t p-db-base:1.0 .

# Build docker container
docker run --name p-db-instance \
           -e POSTGRES_DB="postgres" \
           -e POSTGRES_USER="postgres" \
           -e POSTGRES_PASSWORD="pass1234" \
           -p 5490:5432 \
           -d p-db-base:1.0

# Clean Cintainer and Image
docker rm -f p-db-instancep-db-instance
docker rmi p-db-base:1-0