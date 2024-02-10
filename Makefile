
G_VOLUME_PATH = "/home/kel-baam/data"
DB_VOLUME_PATH = "$(G_VOLUME_PATH)/mariadb"
WP_VOLUME_PATH = "$(G_VOLUME_PATH)/wordpress"

up:
	mkdir -p $(DB_VOLUME_PATH)  $(WP_VOLUME_PATH)
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down
stop_containers:
	@echo "Stopping all containers..."
	-docker stop $$(docker ps -qa) 
rm_containers:
	@echo "Removing all containers..."
	-docker rm $$(docker ps -qa) 
rm_images:
	@echo "Removing all images..."
	-docker rmi -f $$(docker images -qa) 
rm_volumes:
	@echo "Removing all volumes..."
	-docker volume rm -f $$(docker volume ls -q)
	-sudo rm -rf /home/kel-baam/data
rm_networks:
	@echo "Removing all networks..."
	-docker network rm -f $$(docker network ls -q) 
clean_up: stop_containers rm_containers rm_images rm_volumes rm_networks
	




