#!/bin/bash

set -x
set -e

if [ ! -d "/var/lib/ipfs/.ipfs" ]; then
  ipfs init
  ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
  ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080
  ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '["*"]'
 # ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '["http://192.168.1.228", "http://fcloud.pp.ua:5001", "http://localhost", "http://127.0.0.1"]'
  ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "GET", "POST"]'
  ipfs config --json API.HTTPHeaders.Access-Control-Allow-Credentials '["true"]'
fi

if [ -n "${IPFS_ANNOUNCE}" ]; then
  ipfs config --json Addresses.Announce "${IPFS_ANNOUNCE}"
fi

exec $*
