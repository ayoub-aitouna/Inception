
all: up

up:
	@mkdir -p /Users/aaitouna/data/wordpress
	@mkdir -p /Users/aaitouna/data/mariadb
	docker-compose -f ./src/docker-compose.yml up  --build

down:
	docker-compose -f ./src/docker-compose.yml down

atach:
	docker exec -it nginx zsh