#!/bin/bash
DIR=/usr/lib/arm-linux-gnueabihf
PATTEN=libgst*so.0
CHANGE=.1004.0

echo "run with sudo or you may not have permission"

cd $DIR
for FILE in $PATTEN
    do
    echo $FILE
    echo " link to "
    echo $FILE$CHANGE
    ln -sf $FILE$CHANGE $FILE
    done
