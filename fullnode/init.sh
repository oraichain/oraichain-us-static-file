#!/bin/sh

DATA_HOME=${DATA_HOME:-"/root/.evmosd"}

if [[ -d "$DATA_HOME/data" ]] 
then
echo ''
else
    evmosd init "$NODE_NAME" --chain-id=$CHAIN_ID --home $DATA_HOME

    wget https://raw.githubusercontent.com/oraichain/oraichain-us-static-file/master/genesis.json -O $DATA_HOME/config/genesis.json

    sed -i "s/enabled-unsafe-cors *= *.*/enabled-unsafe-cors = true/g" $DATA_HOME/config/app.toml
    sed -i "s/cors_allowed_origins *= *.*/cors_allowed_origins = \[\"*\"\]/g" $DATA_HOME/config/config.toml
    sed -i "1,/\<laddr\>/{s/\<laddr\> *= *.*/laddr = \"tcp:\/\/0.0.0.0:26657\"/g}" $DATA_HOME/config/config.toml # replace exactly the string laddr with\< and \>
    # sed -i "s/persistent_peers *= *.*/persistent_peers = \"4725ef9ef94b4a23fcf99b62b2729ad029545c68@159.203.165.199:26656\"/g" $DATA_HOME/config/config.toml
fi

cosmovisor start --pruning=default --log_level info --json-rpc.api eth,txpool,personal,net,debug,web3 --p2p.persistent_peers "$PERSISTENT_PEERS"