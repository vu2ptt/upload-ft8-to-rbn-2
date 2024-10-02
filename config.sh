#! /bin/sh

DIR=/media/mmcblk0p1/apps/sdr_receiver_ft8_77_76

mount -o rw,remount /media/mmcblk0p1

$DIR/stop.sh

nano $DIR/decode-ft8.sh
nano $DIR/upload-ft8.sh
nano $DIR/write-c2-files.cfg

mount -o ro,remount /media/mmcblk0p1

lbu commit -d

$DIR/start.sh
