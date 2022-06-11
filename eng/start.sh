#!/bin/sh

if ! test -f /qdata/dd/initialized; then
    echo "Quorum initializing..."
    geth --datadir=/qdata/dd init /qdata/dd/genesis.json

    touch /qdata/dd/initialized
else
    echo "Quorum already initialized, skipping..."
fi

export PRIVATE_CONFIG=ignore
export QUORUM_CONSENSUS=raft

geth --datadir /qdata/dd --nodiscover --verbosity 6 --rpc.allow-unprotected-txs \
  --raft --raftport 50400 \
  --rpc --rpcaddr 0.0.0.0 --rpcvhosts=* --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 30303 --allow-insecure-unlock \
  --ws --ws.addr 0.0.0.0 --ws.port 8546 --ws.origins '*' --ws.api personal,admin,db,eth,net,web3,miner,shh,txpool,debug
