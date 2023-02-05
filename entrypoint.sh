#!/usr/bin/env sh
set -e

echo $NODE_ENV;

if [ $NODE_ENV = 'production' ]; then
    sh ./prod.entrypoint.sh
fi

if [ $NODE_ENV = 'development' ]; then
    sh ./dev.entrypoint.sh
fi

if [ $NODE_ENV = 'stage' ]; then
    sh ./stage.entrypoint.sh
fi
