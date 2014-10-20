#!/bin/bash
while ((1))
do
ADDR="$1"
PORT="26262"
wget $ADDR:$PORT 2> /dev/null &
sleep 20
if [[ $(ps aux | grep "[0-9] wget $ADDR:$PORT") ]]
then
kill $!
netvis -connect $ADDR -port $PORT > /dev/null &
netvis -connect $ADDR -port $PORT > /dev/null &
netvis -connect $ADDR -port $PORT
sleep 100
fi
done
