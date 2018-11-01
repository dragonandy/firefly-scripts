#!/bin/bash
DIR=/usr/lib/arm-linux-gnueabihf
PATTEN=libgst*so.0
CHANGE=.1004.0

cd $DIR
for FILE in $PATTEN
    do
    echo $FILE
    ln -sf $FILE$CHANGE $FILE
    done
