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
	-rm -rf brew_auth_service
	-rm -rf brew_sales_service
	-rm -rf	brew_warehouse_service
	-rm -rf brew_nginx_service

clone:
	@echo "Cloning microservices"
	git clone https://github.com/istefano82/brew_sales_service.git
	git clone https://github.com/istefano82/brew_auth_service.git
	git clone https://github.com/istefano82/brew_warehouse_service.git
	git clone https://github.com/istefano82/brew_nginx_service.git

docker-run-dev: clean clone
	docker-compose -f docker-compose.yml up --build



