#!/bin/bash

set -x
set -e

if [ ! -d "${HOME}/.ipfs" ]; then
  ipfs init
fi

exec $*
