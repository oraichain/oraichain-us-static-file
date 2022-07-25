## Add a full node

Preconditional: <strong>git, docker, docker-compose</strong>

<ins>Step 1</ins>: clone this repo into your server
<ins>Step 2</ins>: change directory to fullnode, and edit docker-compose.yml file. Let change the value of NODE_NAME (from environment)
<ins>Step 3</ins>: run command
> docker-compose up -d

<ins>Step 4</ins>: Please enter the container and get more info
docker-compose exec orain bash
- get your node status: 
> evmosd status
* get your node id:
> evmosd tendermint show-node-id
* check your server port:
> ip_public:1317/blocks/latest
> ip_public:26657/status

## Add a validator
```
Underconstruct
```