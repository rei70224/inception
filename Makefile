.PHONY: all up down log clean fclean re

all: up

up:
	docker compose -f srcs/docker-compose.yml up -d --build

down:
	docker compose -f srcs/docker-compose.yml down

log:
	docker compose -f srcs/docker-compose.yml logs

clean:
	docker compose down -f srcs/docker-compose.yml -v --rmi all --remove-orphans

fclean: clean

re: fclean all
