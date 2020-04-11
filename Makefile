.DEFAULT_GOAL := help

help:
	@echo "Defined targets:"
	@echo "----------------"
	@echo "help               	This text"
	@echo "clone              	Clone configured microservices"
	@echo "docker-run-dev     	Run the service in dev mode (in Linux guest only)"

#-----------------------------------------------------------------------------

clone:
	@echo "Cloning microservices"
	git clone https://github.com/istefano82/brew_sales_service.git
	git clone https://github.com/istefano82/brew_auth_service.git
	git clone https://github.com/istefano82/brew_warehouse_service.git

docker-run-dev: clone
	docker-compose -f docker-compose.yml up --build



