# upload-ft8-to-rbn-2
A set of scripts and utilities for uploading FT8 decodes based on original by Bjorn Ekelund SM7IUN 
from a [QMTECH PDSDR](https://pavel-demin.github.io/qmtech-xc7z020-notes/components/) based, 
[multi-band FT8 receiver](https://pavel-demin.github.io/qmtech-xc7z020-notes/) 
to the [Reverse Beacon Network](http://www.reversebeacon.net) via 
[RBN Aggregator](http://www.reversebeacon.net/pages/Aggregator+34). 
Although grid is set in the script, call sign and grid associated 
with the spots are determined by the settings in RBN Aggregator. 

Based on the GitHub [upload-to-rbn](https://github.com/bjornekelund/upload-to-rbn) utility by Bjorn SM7IUN. Additional information on his original version is [here](https://sm7iun.ekelund.nu/redpitaya/ft8skimmer). 

Contains a shell script [temp.sh](https://github.com/vu2ptt/upload-ft8-to-rbn-2/blob/master/temp.sh) which is installed in the home
folder to check the operating temperature of the Zynq 7020 SoC. 

Also contains a quick-and-dirty server in perl offering a DX 
Cluster like stream of spots via telnet on port 7373. 
(Requires perl to be installed).

> apk update
> apk add perl

In this version I have enabled 16 receiver slices in the FT8 receiver as configured 
in write-c2-files.cfg. This has been updated in the Telnet server perl script as well.

bands = (
  { freq  =  1.841500; },
  { freq  =  3.574500; },
  { freq  =  5.358500; },
  { freq  =  7.057500; },
  { freq  =  7.075500; },
  { freq  = 10.132500; },
  { freq  = 10.137500; },
  { freq  = 14.075500; },
  { freq  = 18.096500; },
  { freq  = 18.101500; },
  { freq  = 21.075500; },
  { freq  = 24.912500; },
  { freq  = 24.916500; },
  { freq  = 28.075500; },
  { freq  = 50.314500; },
  { freq  = 50.324500; }
);

**IMAGE FILE:**
=============
The folder [image](https://github.com/vu2ptt/upload-ft8-to-rbn-2/tree/master/image) has a URL link to the fully functional 32 GB image of the FT8 receiver with UDP to Aggregator hosted on my OneDrive. If you use this image, **do not forget to change the Callsign and Grid location** to match yours in the file ~/apps/sdr_receiver_ft8_77_76/upload-ft8.sh on the SDcard.

I use [ImageUSB from PassMark](https://www.osforensics.com/tools/write-usb-images.html) to make SD cards and images. 

73,

Prasad VU2PTT.
