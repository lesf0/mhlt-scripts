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
bash -c "rm $(echo $1 | sed 's|map|{l*,p*,w*}|')"
etime=$(date +%s)
let "ttime = etime - stime"
echo "Процесс завершен за $ttime секунд"
