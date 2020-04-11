
# Microbrewery microservices API
 Defines Authenticaion, Sales, Warehouse microservices

## Requirements
 * git, docker, docker-compose 
 * Install docker https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
 * Install docker-compose https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04

## Setup
 * ```git clone https://github.com/istefano82/brew_services_root.git```
 * ```cd brew_services_root```
 *  Start service containers in daemon mode
 ```
    make docker-run-dev
```
 * Change the example settings in each of the .env files (Project root and microservices) to your preference
## Usage:
### Get API reference
 * http://0.0.0.0/swagger/ - Authentication microservice Swagger API
 * curl http://0.0.0.0/swagger.json - CLI API description
 * http://0.0.0.0:8002/swagger/ - Warehouse microservice Swagger API
 * curl http://0.0.0.0:8002/swagger.json - CLI API description
 * http://0.0.0.0:8003/swagger/ - Sales microservice Swagger API
 * curl http://0.0.0.0:8003/swagger.json - CLI API description
 
 ### Microservice endpoints behind nginx proxy
  * AUTH service - http://0.0.0.0/
  * Sales service - http://0.0.0.0/brew_sales/
  * AUTH service - http://0.0.0.0/brew_warehouse/
  
 ### Microservice endpoints direct
  * AUTH service - http://0.0.0.0:8001/
  * Sales service - http://0.0.0.0:8002
  * AUTH service - http://0.0.0.0:8003
 
 When Using web SWAGGER API client make sure you authorize with Sales, Warehouse services with the 
 JWT tokern returned from registration/login (Hint: Authorizaion should be located top right corner)
 
 ### Example workflow
  1. Register with Auth service:
   ```curl -X POST "http://0.0.0.0/api/v0/brew_auth/register/" -H  "accept: application/json" -H  "Content-Type: application/json" -H  "X-CSRFToken: vMUCI6H4nHR5Qpn5jnUPSwn5CTkIjIQtDcsVZdO1iG0oOej8ByON30BblJjwtTv7" -d "{  \"username\": \"string\",  \"email\": \"user@example.com\",  \"password\": \"string\",  \"password2\": \"string\"}"```
  2. Copy the returned JWT token without quotes:
  ```eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6InN0cmluZyIsImV4cCI6MTU4NjYzNTU2NiwiZW1haWwiOiJ1c2VyQGV4YW1wbGUuY29tIiwib3JpZ19pYXQiOjE1ODY2MzE5NjZ9.yoOmqSDkqQf41eD2EEqgoMiKSXlDmeiyPMoiwlbk6oI```
  3. Create warehouse item use the JWT token in authorizaion header
  ```curl -X POST "http://0.0.0.0/brew_warehose/api/v0/brew_warehouse/warehouse_item/" -H  "accept: application/json" -H  "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InN0cmluZyIsImV4cCI6MTU4NjYzNTU3NywiZW1haWwiOiJ1c2VyQGV4YW1wbGUuY29tIiwib3JpZ19pYXQiOjE1ODY2MzE5Nzd9.U3pi1PxspB8-uhcdR0gZKDP2INUyUXFd__E9988PKrQ" -H  "Content-Type: application/json" -H  "X-CSRFToken: rskfKZ9RAxOyYptECKnvy1qAo4axf7FlzSSy16gOvwXRWepHUVhtJvEG7U9lpikZ" -d "{  \"title\": \"Beer Keg\",  \"content\": \"Light beer keg\",  \"quantity\": 10}"```
  or
  ```curl -X POST "http://0.0.0.0:8002/api/v0/brew_warehouse/warehouse_item/" -H  "accept: application/json" -H  "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InN0cmluZyIsImV4cCI6MTU4NjYzNTU3NywiZW1haWwiOiJ1c2VyQGV4YW1wbGUuY29tIiwib3JpZ19pYXQiOjE1ODY2MzE5Nzd9.U3pi1PxspB8-uhcdR0gZKDP2INUyUXFd__E9988PKrQ" -H  "Content-Type: application/json" -H  "X-CSRFToken: rskfKZ9RAxOyYptECKnvy1qAo4axf7FlzSSy16gOvwXRWepHUVhtJvEG7U9lpikZ" -d "{  \"title\": \"Beer Keg\",  \"content\": \"Light beer keg\",  \"quantity\": 10}"```
  4. List warehouse items use the JWT token in authorizaion header
  ```curl -X GET "http://0.0.0.0:8002/api/v0/brew_warehouse/warehouse_item/" -H  "accept: application/json" -H  "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6InN0cmluZyIsImV4cCI6MTU4NjYzNTU3NywiZW1haWwiOiJ1c2VyQGV4YW1wbGUuY29tIiwib3JpZ19pYXQiOjE1ODY2MzE5Nzd9.U3pi1PxspB8-uhcdR0gZKDP2INUyUXFd__E9988PKrQ" -H  "X-CSRFToken: rskfKZ9RAxOyYptECKnvy1qAo4axf7FlzSSy16gOvwXRWepHUVhtJvEG7U9lpikZ"```
  5. Create a sale use the JWT token in authorizaion header
  ```curl -X POST "http://0.0.0.0:8003/api/v0/brew_sales/sales_item/" -H  "accept: application/json" -H  "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6InN0cmluZyIsImV4cCI6MTU4NjYzNTU2NiwiZW1haWwiOiJ1c2VyQGV4YW1wbGUuY29tIiwib3JpZ19pYXQiOjE1ODY2MzE5NjZ9.yoOmqSDkqQf41eD2EEqgoMiKSXlDmeiyPMoiwlbk6oI" -H  "Content-Type: application/json" -H  "X-CSRFToken: ZFwSk2bna2bVpyu4xgxcueedIrNlebu1754bB9ik51kennq7PrraFIsjrhM9om9F" -d "{  \"title\": \"Beer,  \"sales_amount\": 550,  \"sales_person\": \"Bob\"}"```
  6. Get total sales amount
  ```curl -X GET "http://0.0.0.0:8003/api/v0/brew_sales/sales_item/total_sales/" -H  "accept: application/json" -H  "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJ1c2VybmFtZSI6InN0cmluZyIsImV4cCI6MTU4NjYzNTU2NiwiZW1haWwiOiJ1c2VyQGV4YW1wbGUuY29tIiwib3JpZ19pYXQiOjE1ODY2MzE5NjZ9.yoOmqSDkqQf41eD2EEqgoMiKSXlDmeiyPMoiwlbk6oI" -H  "X-CSRFToken: ZFwSk2bna2bVpyu4xgxcueedIrNlebu1754bB9ik51kennq7PrraFIsjrhM9om9F"```
 
 ## Running tests - Auth and Sales microservices have tests
  * open container shell 
   ```sudo docker exec -it  brew_services_root_brew_auth_1 /bin/sh```
   ```sudo docker exec -it  brew_services_root_brew_sales_1 /bin/sh```

  * Run test suits 
    ```python manage.py test```
     
  ## "Microbrewery module diagram
 ![](./docs/MicroBrewModuleDiagram.png)
 
 ## "Microbrewery serices usage sequence diagram
 ![](./docs/MicroBrewSequenceDiagram.png)
