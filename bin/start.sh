docker network create -d overlay dockernode-network
docker service create -d -e "MONGODB_SERVICE_SERVICE_HOST=dockernode-db" --replicas 3 --network dockernode-network --label com.docker.lb.hosts=nodeapp.local --label com.docker.lb.port=4000 --name dockernode-app yongshin/docker-node-app
docker service create -d --name dockernode-db --mount type=volume,destination=/data/db --network dockernode-network --publish 27017:27017 mongo
