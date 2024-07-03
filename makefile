.DEFAULT_GOAL := up


## Development
build: ## Build the Docker images using the development overrides.
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml build --parallel $(c)
	docker image prune -f

rebuild: ## Force rebuild the Docker images without the build cache using the development overrides.
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml build --parallel --no-cache $(c)
	docker image prune -f

up: ## Builds, (Re)Creates (Updates), Starts and Attaches the Docker containers in the development configuration (with ports open to the host for debugging).
	docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d $(c)
	docker image prune -f


## Production
prod-build: ## Build the Docker images using the development overrides.
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml build --parallel $(c)
	docker image prune -f

prod-rebuild: ## Force rebuild the Docker images without the build cache using the development overrides.
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml build --parallel --no-cache $(c)
	docker image prune -f

prod-up: ## Builds, (Re)Creates (Updates), Starts and Attaches the Docker containers in the development configuration (with only the frontend exposing it's ports).
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d $(c)
	docker image prune -f


## Shutdown
down: ## Stops and Deletes the containers and networks.
	# Up the timeout time to allow MongoDB to shutdown gracefully.
	docker-compose -f docker-compose.yml down -t 120 $(c)

destroy: ## Stops and Deletes the container, networks and volumes.
		 ## WARNING: Can cause data to be destroyed.
	# Up the timeout time to allow MongoDB to shutdown gracefully.
	docker-compose -f docker-compose.yml down -t 120 -v $(c)


## Life Cycle
start: ## Start the stopped containers for the project.
	docker-compose -f docker-compose.yml start $(c)

stop: ## Stop the running containers for the project.
	docker-compose -f docker-compose.yml stop $(c)

restart: ## Restart the containers for the project.
	docker-compose -f docker-compose.yml stop $(c)
	docker-compose -f docker-compose.yml up -d $(c)


## Administrative
ps: ## List the containers for the project.
	docker-compose -f docker-compose.yml ps

logs: ## Show the last 100 lines in the combined logs.
	docker-compose -f docker-compose.yml logs --tail=100 -f $(c)


## Cleanup
clean-docker: clean-docker-images clean-docker-containers clean-docker-networks ## Meta rule for cleaning Docker images, containers and networks without clearing the build cache.

clean-docker-images: ## Removes dangling (untagged and unused) images.
	docker image prune -f

clean-docker-containers: ## Removes stopped containers.
	docker container prune -f

clean-docker-networks: ## Removes networks with no containers currently attached to them.
	docker network prune -f

clean-docker-volumes: ## Removes currently unused docker volumes. WARNING: Can cause data to be destroyed.
	docker volume prune -f

clean-docker-full: ## Cleans Docker, removing all stopped containers, unused networks, dangling images, and the build cache. Doesn't delete volumes.
	docker system prune -f


## Help
help: ## This command, shows the list of commands and a short description of each.
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m## /[33m/'
# 	@awk -F ':|##' \
# 		'/^[^\t].+?:.*?##/ {\
# 			printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF \
# 		}' $(MAKEFILE_LIST)

.PHONY: build rebuild up prod-build prod-rebuild prod-up down destroy start stop restart ps	logs \
		clean-docker clean-docker-images clean-docker-containers clean-docker-networks clean-docker-volumnes clean-docker-full help
