
all: up

up:
	@mkdir -p /Users/aaitouna/data/wordpress
	@mkdir -p /Users/aaitouna/data/mariadb
	docker-compose -f ./src/docker-compose.yml up -d --build

down:
	docker-compose -f ./src/docker-compose.yml down

atach:
	docker exec -it nginx zsh

fclean: down
	docker rmi $$(docker images -a -q) &2>/dev/null
	docker network rm $$(docker network ls -q) &2>/dev/null
	docker volume rm $$(docker volume ls -q) &2>/dev/null
	rm -rf /Users/aaitouna/data/wordpress 
	rm -rf /Users/aaitouna/data/mariadb

clean_cache: fclean
	docker system prune -a
