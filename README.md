## Add a full node

Preconditional: <strong>git, docker, docker-compose, a name for your node</strong>

<ins>Step 1</ins>: clone this repo into your server.

<ins>Step 2</ins>: change directory to fullnode folder, and edit docker-compose.yml file. Let change the value of NODE_NAME (from environment).

<ins>Step 3</ins>: run up command.
> docker-compose up -d

<ins>Step 4</ins>: Please enter the container and get more info.
> docker-compose exec orain bash

- get your node status: 
> evmosd status
* get your node id:
> evmosd tendermint show-node-id
* check your server port:
> ip_public:1317/blocks/latest
> ip_public:26657/status

## Add a validator

Preconditional: <strong>git, docker, docker-compose, a name, mnemonic, password for your node</strong> You can generate a mnemonic: https://iancoleman.io/bip39/

<ins>Step 1</ins>: clone this repo into your server.

<ins>Step 2</ins>: change directory to validator folder, and edit docker-compose.yml file. Let change the value of NODE_NAME (from environment).

<ins>Step 3</ins>: run up command.
> docker-compose up -d

<ins>Step 4</ins>: Please enter the container and setup your validator node.
> docker-compose exec orain bash

<ins>Step 5</ins>: Create your validator key. Run below command and following the instruction (need to input mnemonic and password)
> evmosd keys add validator_key --recover

<ins>Step 6</ins>: Logout your container and start syncing in the background
> docker-compose exec -d orain bash -c "evmosd start --pruning=nothing --rpc.unsafe --log_level info --json-rpc.api eth,txpool,personal,net,debug,web3 --moniker 'ADD_YOUR_NODE_NAME_HERE'"
