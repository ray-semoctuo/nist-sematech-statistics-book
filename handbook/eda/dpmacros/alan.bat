#!/bin/csh -f
#
# Run via: generic.build  4-plot
#
dataplot < $1.dp
mv dppl1f.dat $1.ps
gs -sDEVICE=ppm -sOutputFile=$1.ppm  -dNOPAUSE -dBATCH $1.ps
~heckert/bin/pnmrotate  -90 $1.ppm > $1_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 $1_r.ppm > $1_s.ppm
~heckert/bin/ppmtogif  $1_s.ppm > $1.gif
mv $1.gif ../gif/$1.gif
rm $1.ppm $1_r.ppm $1_s.ppm $1.ps
#
