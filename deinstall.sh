#! /bin/sh

DIR=/media/mmcblk0p1/apps/sdr_receiver_ft8_77_76

$DIR/stop.sh
mount -o rw,remount /media/mmcblk0p1
cp $DIR/decode-ft8.sh.orig $DIR/decode-ft8.sh
rm $DIR/decode-ft8.sh.orig
cp $DIR/write-c2-files.cfg.orig $DIR/write-c2-files.cfg
rm $DIR/write-c2-files.cfg.orig
lbu commit -d
mount -o ro,remount /media/mmcblk0p1
$DIR/start.sh
