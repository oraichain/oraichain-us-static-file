#!/bin/sh

DATA_HOME=${DATA_HOME:-"/root/.evmosd"} 

if [[ -d "$DATA_HOME/data" ]] 
then
echo ''
else
    evmosd init "$NODE_NAME" --chain-id=balcony_666666-1 --home $DATA_HOME

    wget https://raw.githubusercontent.com/oraichain/oraichain-us-static-file/master/fullnode/config/genesis.json -O $DATA_HOME/config/genesis.json
fi

cosmovisor start --pruning=default --log_level info --json-rpc.api eth,txpool,personal,net,debug,web3 --p2p.persistent_peers "$PERSISTENT_PEERS"