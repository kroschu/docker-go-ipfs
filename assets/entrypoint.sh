#!/bin/bash

set -x
set -e

if [ ! -d "/var/lib/ipfs/.ipfs" ]; then
  ipfs init
  ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
  ipfs config Addesses.Gateway /ip4/0.0.0.0/tcp/8080
fi

exec $*
