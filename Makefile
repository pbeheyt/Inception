all:
	sudo docker compose -f ./srcs/docker-compose.yml up -d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo docker system prune -af

fclean: clean
	@if [ -d "/home/pbeheyt/data/wordpress" ]; then \
	sudo rm -rf /home/pbeheyt/data/wordpress/*; \
	fi;

	@if [ -d "/home/pbeheyt/data/mariadb" ]; then \
	sudo rm -rf /home/pbeheyt/data/mariadb/*; \
	fi;

	@if [ -d "/home/pbeheyt/data/portainer" ]; then \
	sudo rm -rf /home/pbeheyt/data/portainer/*; \
	fi;

re: fclean all

.PHONY: all, clean, fclean, re