NAME=redwhale

##########
# SYSTEM #
##########
	
clean: 
	docker ps \
		--quiet \
		--filter ancestor=$(NAME) \
	| xargs \
		--no-run-if-empty \
		docker stop
	docker system prune \
		--force

build-core:
	docker build \
		--tag $(NAME):core \
		./core

##############
# CONTROLLER #
##############

build-controller:
	docker build \
		--tag $(NAME)-controller \
		./controller
	docker run \
		--name $(NAME)-controller \
		--privileged \
		--detach \
		$(NAME)-controller
	docker exec \
		--tty \
		--interactive \
		$(NAME)-controller \
		bash -c "su stack -c '/devstack/stack.sh'"

start-controller:
	docker start $(NAME)-controller	

stop-controller:
	docker stop $(NAME)-controller
	
bash-controller:
	docker exec \
		--tty \
		--interactive \
		$(NAME)-controller \
		bash

###########
# Compute #
###########

build-compute:
	docker rmi $(NAME)-compute 2> /dev/null; docker build \
		--tag $(NAME)-compute \
		./compute
	docker run \
		--name $(NAME)-compute-$(name) \
		--privileged \
		--cap-add=NET_ADMIN \
		--detach \
		$(NAME)-compute
	docker exec \
		--tty \
		--interactive \
		$(NAME)-compute-$(name) \
		bash -c "apt-get update && apt-get install ebtables && su stack -c '/devstack/stack.sh'"

start-compute:
	docker start $(NAME)-compute-$(name)

stop-compute:
	docker stop $(NAME)-compute-$(name)

bash-compute:
	docker exec \
		--tty \
		--interactive \
		$(NAME)-compute-$(name) \
		bash

