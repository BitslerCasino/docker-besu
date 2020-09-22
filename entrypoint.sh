#!/bin/bash

set -e
# config sanity check

CONFIG=/var/lib/besu/config.toml

if [ ! -f "$CONFIG" ]; then
    echo "$CONFIG is missing. Make sure you mount the config.toml properly"
    exit
fi

if [ -z "$WALLET_NAME" ]; then
    echo "WALLET_NAME env is missing. Make sure to set the WALLET_NAME environment variable"
    exit
fi

exec besu "$@"

