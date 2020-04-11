.DEFAULT_GOAL := help


help:
	@echo "Defined targets:"
	@echo "----------------"
	@echo "help               	This text"
	@echo "clean	            Remove microservices directories"
	@echo "clone              	Clone configured microservices"
	@echo "docker-run-dev     	Run the service in dev mode (in Linux guest only)"

#-----------------------------------------------------------------------------

clean:
	rm -rf brew_sales_service, brew_warehouse_service, brew_auth_service, brew_nginx_service

clone:
	@echo "Cloning microservices"
	git force-clone https://github.com/istefano82/brew_sales_service.git
	git force-clone https://github.com/istefano82/brew_auth_service.git
	git force-clone https://github.com/istefano82/brew_warehouse_service.git
	git force-clone https://github.com/istefano82/brew_nginx_service.git

docker-run-dev: clone
	docker-compose -f docker-compose.yml up --build



