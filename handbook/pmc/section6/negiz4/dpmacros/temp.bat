#!/bin/csh -f 
#
will.bat  autocopl.ps
giftrans -t \#ffffff -o temp.gif autocopl.gif; mv temp.gif  ../gif/autocopl.gif
will.bat  partaupl.ps
giftrans -t \#ffffff -o temp.gif partaupl.gif; mv temp.gif  ../gif/partaupl.gif
will.bat  res4plot.ps
giftrans -t \#ffffff -o temp.gif res4plot.gif; mv temp.gif  ../gif/res4plot.gif
will.bat  reshist.ps
giftrans -t \#ffffff -o temp.gif reshist.gif; mv temp.gif  ../gif/reshist.gif
will.bat  reslag.ps
giftrans -t \#ffffff -o temp.gif reslag.gif; mv temp.gif  ../gif/reslag.gif
will.bat  resnprpl.ps
giftrans -t \#ffffff -o temp.gif resnprpl.gif; mv temp.gif  ../gif/resnprpl.gif
will.bat  resrunsq.ps
giftrans -t \#ffffff -o temp.gif resrunsq.gif; mv temp.gif  ../gif/resrunsq.gif
will.bat  runseqpl.ps
giftrans -t \#ffffff -o temp.gif runseqpl.gif; mv temp.gif  ../gif/runseqpl.gif
