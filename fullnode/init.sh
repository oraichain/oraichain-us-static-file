#!/bin/bash

evmosd init "$NODE_NAME" --chain-id=balcony_666666-1

cp -R /root/config/* /root/.evmosd/config/

evmosd start --pruning=nothing --rpc.unsafe --log_level info --json-rpc.api eth,txpool,personal,net,debug,web3 --moniker "$NODE_NAME"
