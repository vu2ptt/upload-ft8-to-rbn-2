#! /bin/sh

DIR=/media/mmcblk0p1/apps/sdr_receiver_ft8_77_76

mount -o rw,remount /media/mmcblk0p1

$DIR/stop.sh

chmod +x *.sh upload-to-rbn

cp temp.sh ~

cp upload-to-rbn $DIR

# Back up original decode-ft8.sh 
test -e $DIR/decode-ft8.sh.orig || cp $DIR/decode-ft8.sh $DIR/decode-ft8.sh.orig
cp decode-ft8.sh $DIR

# Back up original write-c2-files.cfg 
test -e $DIR/write-c2-files.cfg.orig || cp $DIR/write-c2-files.cfg $DIR/write-c2-files.cfg.orig
cp write-c2-files.cfg $DIR

# Set FT8 receiver to run at boot
cp $DIR/start.sh /media/mmcblk0p1

lbu commit -d

mount -o ro,remount /media/mmcblk0p1

