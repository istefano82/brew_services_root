
# Microbrewery microservices API
 Defines Authenticaion, Sales, Warehouse microservices

## Setup
 * ```git clone git clone https://github.com/istefano82/brew_services_root.git```
 * ```cd brew_services_root```
 *  Start service containers in daemon mode
 ```
    make docker-run-dev
```
### Usage:

 * http://0.0.0.0/swagger/ - Authentication microservice Swagger API
 * curl http://0.0.0.0/swagger.json - CLI API description
 * http://0.0.0.0:8002/swagger/ - Warehouse microservice Swagger API
 * curl http://0.0.0.0:8002/swagger.json - CLI API description
 * http://0.0.0.0:8003/swagger/ - Sales microservice Swagger API
 * curl http://0.0.0.0:8003/swagger.json - CLI API description
 
  ## "Microbrewery module diagram
 ![](./docs/MicroBrewModuleDiagram.png)
 
 ## "Microbrewery serices usage sequence diagram
 ![](./docs/MicroBrewSequenceDiagram.png)
