## Add a full node

Preconditional: <strong>docker, docker-compose, a name for your node. OS: Linux</strong>

<ins>Step 1</ins>: Download necessary prerequisite files: 

```
wget https://raw.githubusercontent.com/oraichain/oraichain-us-static-file/master/fullnode/docker-compose.yml && wget https://raw.githubusercontent.com/oraichain/oraichain-us-static-file/master/fullnode/init.sh
```

<ins>Step 2</ins>: Edit docker-compose.yml file. Let change the value of NODE_NAME & PERSISTENT_PEERS (from environment).

<ins>Step 3</ins>: run up command.

`docker-compose up -d`

<ins>Step 4</ins>: Please enter the container and get more info.

`docker-compose exec orain bash`

- get your node status: 
> evmosd status
* get your node id:
> evmosd tendermint show-node-id
* check your server port:
> ip_public:1317/blocks/latest
> ip_public:26657/status

## Add a validator

Preconditional: <strong>docker, docker-compose, a name, mnemonic, password for your node</strong> You can generate a mnemonic: https://iancoleman.io/bip39/ or through OWallet, Keplr wallet.

<ins>Step 1</ins>: Download necessary prerequisite files: 

```
wget https://raw.githubusercontent.com/oraichain/oraichain-us-static-file/master/validator/docker-compose.yml && wget https://raw.githubusercontent.com/oraichain/oraichain-us-static-file/master/validator/init.sh
```

<ins>Step 2</ins>: Edit docker-compose.yml file. Let change the value of NODE_NAME & PERSISTENT_PEERS (from environment).

Example for the list of persistent peers in the docker-compose file: 8c01a279e6d62c89a0deb09bb23f9b5ae1969be8@1.2.3.4:26656,8c01a279e6d62c89a0deb09bb23f9b5ae1969be8@4.5.6.7:26656

Current usable persistent peers: 

```
8c01a279e6d62c89a0deb09bb23f9b5ae1969be8@67.205.169.224:25656
```

<ins>Step 3</ins>: run up command.

`docker-compose up -d`

<ins>Step 4</ins>: Please enter the container and setup your validator node.

`docker-compose exec orain bash`

<ins>Step 5</ins>: Create your validator key. Run below command and following the instruction (need to input mnemonic and password)

`evmosd keys add validator_key --recover`

<ins>Step 6</ins>: After your validator node synced successfully, you can create validator account. (You need some orain) Please enter the container and run bellow command (you can change your content)

```
evmosd tx staking create-validator \
  --amount=1aorain \
  --pubkey=$(evmosd tendermint show-validator) \
  --moniker="validator" \
  --website="https://orai.io" \
  --details="To infinity and beyond!" \
  --chain-id=oraichainpro_66666-1 \
  --commission-rate="0.05" \
  --commission-max-rate="1" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1" \
  --gas="auto" \
  --gas-adjustment="1.5" \
  --from=validator_key -y
```

<ins>Step 8</ins>: Please enter the container and get more info.

`docker-compose exec orain bash`

- get your node status: 
> evmosd status