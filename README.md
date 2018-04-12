# Docker NodeJS Example with Docker EE 2.0

### Prerequisites

* Docker EE 2.0
  * 17.06.3-ee-1 Engine
  * UCP 3.0.0
  * DTR 2.5.0

### Setup UCP and DTR

Set up UCP and DTR per instructions found here: https://github.com/yongshin/vagrant-docker-ee-ubuntu.

### Create DTR repo

```
engineering/docker-node-app
```

### Build Docker Image
```  
export DTR_IPADDR=dtr.local

git clone git@github.com:yongshin/docker-node-app.git
cd ~/docker-node-app
docker build -t $DTR_IPADDR/engineering/docker-node-app .
```

### Start Example Application
```
# Source client bundle
docker stack deploy -c deploy/swarm/docker-compose.yml nodeapp
```

### Stop all
In case you need to stop everything run:
```
docker stack rm nodeapp
```

### Try deploying app locally for development on Docker CE
```
docker build -t yongshin/docker-node-app .
docker stack deploy -c deploy/swarm/docker-compose-local.yml nodeapp
```
