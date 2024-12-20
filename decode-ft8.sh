#! /bin/sh

# Station parameters
UDPPORT=2267
# End of station parameters

JOBS=4
NICE=10

BROADCASTIP=`ip a s dev eth0 | awk '/inet / {print $4}'`
DIR=`readlink -f $0`
DIR=`dirname $DIR`

RECORDER=$DIR/write-c2-files
CONFIG=write-c2-files.cfg

DECODER=/media/mmcblk0p1/apps/ft8d/ft8d

SLEEP=/media/mmcblk0p1/apps/common_tools/sleep-to-59

test $DIR/$CONFIG -ot $CONFIG || cp $DIR/$CONFIG $CONFIG

#echo `date --utc +"%Y-%m-%d "` "Sleeping ..."
echo "Slp"

$SLEEP

sleep 1

TIMESTAMP=`date --utc +'%y%m%d_%H%M'`

#echo `date --utc +"%H:%M:%SZ"` "Rec using $CONFIG ..."
echo "Rec"

killall -q $RECORDER

$RECORDER $CONFIG

#echo `date --utc +"%H:%M:%SZ"` "Decoding ..."
echo "Dec"

for file in ft8_*_$TIMESTAMP.c2
do
  while [ `pgrep $DECODER | wc -l` -ge $JOBS ]
  do
    sleep 1
  done
  nice -n $NICE $DECODER $file &
done > decodes_$TIMESTAMP.txt

wait

#echo `date --utc +"%Y-%m-%d %H:%M:%SZ"` "Uploading to RBN..."
$DIR/upload-to-rbn $BROADCASTIP $UDPPORT decodes_$TIMESTAMP.txt
echo "Upl:" `wc -l < decodes_$TIMESTAMP.txt`" spots @" `date --utc +"%h %d %H:%M:%SZ"`" on $BROADCASTIP UDP port $UDPPORT"

rm -f ft8_*_$TIMESTAMP.c2
