
all: up

up:
	@mkdir -p /Users/aaitouna/data/{wordpress, mariadb}
	docker-compose --env-file ./src/.env -f ./src/docker-compose.yml up -d 

down:
	docker-compose -f ./src/docker-compose.yml down

atach:
	docker exec -it src-nginx-1 zsh