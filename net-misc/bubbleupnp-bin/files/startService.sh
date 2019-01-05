#!/bin/bash

if [ -f "$DEFAULTFILE" ]; then
        . "$DEFAULTFILE"
else
        USER=root
        DATADIR=/root/.bubbleupnp
        HTTP_PORT=58050
        HTTPS_PORT=58051
fi

# Make sure daemon is started with system locale
if [ -r /etc/default/locale ]; then
        . /etc/default/locale
        export LANG
fi

OPTS="-dataDir ${DATADIR} -httpPort ${HTTP_PORT} -httpsPort ${HTTPS_PORT} -nologstdout"
