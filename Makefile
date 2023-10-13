all:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

term:
	sudo docker compose -f ./srcs/docker-compose.yml up

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo docker system prune -a

fclean: clean
	@if [ -d "/home/pbeheyt/data/wordpress" ]; then \
	sudo rm -rf /home/pbeheyt/data/wordpress/*; \
	fi;

	@if [ -d "/home/pbeheyt/data/mariadb" ]; then \
	sudo rm -rf /home/pbeheyt/data/mariadb/*; \
	fi;

re: fclean all

.PHONY: all, clean, fclean, re