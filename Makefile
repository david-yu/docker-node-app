
.PHONEY: all image

all: image

help:    ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

image:
	docker build -t yongshin/docker-node-app .

local:
	docker stack deploy -c deploy/swarm/docker-compose-local.yml nodeapp

build:
	npm install

rm:
	docker stack rm nodeapp

clean:
	rm -rf ./node_modules
