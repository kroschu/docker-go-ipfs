#!/bin/bash

set -x
set -e

if [ ! -d "/var/lib/ipfs/.ipfs" ]; then
  ipfs init
fi

exec $*
