#!/bin/bash
stime=$(date +%s)
mv $1 $1_
iconv $1_ -f cp1251 -o $1
rm $1_
sed -i 's|.home[^;]*wads.|../wads/|g' $1
hlglue $1
rm $1
mv $1_ $1
hlcsg -texdata 8192 -nowadtextures $1
hlbsp -texdata 8192 $1
vtime=$(date +%s)
sleep 2 && netvis -connect 127.0.0.1 -port 26262 > /dev/null &
sleep 2 && netvis -connect 127.0.0.1 -port 26262 > /dev/null &
sleep 2 && netvis -connect 127.0.0.1 -port 26262 > /dev/null &
sleep 2 && netvis -connect 127.0.0.1 -port 26262 > /dev/null &
netvis -server -rate 15 -port 26262 -texdata 8192 -full $1
rtime=$(date +%s)
hlrad -texdata 8192 -chart -extra -dscale 1 -bounce 4 -smooth 100 $1 
bash -c "rm $(echo $1 | sed 's|map|{l*,p*,w*}|')"
etime=$(date +%s)
let "ttime = etime - stime"
let "vttime = rtime - vtime"
let "rttime = etime - rtime"
echo "Процесс завершен за $ttime секунд (из них $vttime заняло выполнение vis и $rttime - выполнение rad)"
