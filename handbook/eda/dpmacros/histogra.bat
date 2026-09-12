#!/bin/csh -f
#! this is file    histogra.bat
#! purpose--transform dataplot postscript output files histogr*.ps
#!          into individual gif files for the sematech handbook

#! -----plot 0 (typical histogram)-----

mv HISTOGR0.PS histogr0.ps
gs -sDEVICE=ppm -sOutputFile=histogr0.ppm  -dNOPAUSE -dBATCH histogr0.ps
~heckert/bin/pnmrotate  -90 histogr0.ppm > histogr0_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 histogr0_r.ppm > histogr0_s.ppm
~heckert/bin/ppmtogif  histogr0_s.ppm > histogr0.gif
mv histogr0.gif ../gif/histogr0.gif
# rm histogr0.ppm histogr0_r.ppm histogr0_s.ppm histogr0.ps

#! -----plot 1 (normal)-----

mv HISTOGR1.PS histogr1.ps
gs -sDEVICE=ppm -sOutputFile=histogr1.ppm  -dNOPAUSE -dBATCH histogr1.ps
~heckert/bin/pnmrotate  -90 histogr1.ppm > histogr1_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 histogr1_r.ppm > histogr1_s.ppm
~heckert/bin/ppmtogif  histogr1_s.ppm > histogr1.gif
mv histogr1.gif ../gif/histogr1.gif
# rm histogr1.ppm histogr1_r.ppm histogr1_s.ppm histogr1.ps

#! -----plot 2 (short-tailed)

mv HISTOGR2.PS histogr2.ps
gs -sDEVICE=ppm -sOutputFile=histogr2.ppm  -dNOPAUSE -dBATCH histogr2.ps
~heckert/bin/pnmrotate  -90 histogr2.ppm > histogr2_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 histogr2_r.ppm > histogr2_s.ppm
~heckert/bin/ppmtogif  histogr2_s.ppm > histogr2.gif
mv histogr2.gif ../gif/histogr2.gif
# rm histogr2.ppm histogr2_r.ppm histogr2_s.ppm histogr2.ps

#! -----plot 3 (long-tailed)

mv HISTOGR3.PS histogr3.ps
gs -sDEVICE=ppm -sOutputFile=histogr3.ppm  -dNOPAUSE -dBATCH histogr3.ps
~heckert/bin/pnmrotate  -90 histogr3.ppm > histogr3_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 histogr3_r.ppm > histogr3_s.ppm
~heckert/bin/ppmtogif  histogr3_s.ppm > histogr3.gif
mv histogr3.gif ../gif/histogr3.gif
# rm histogr3.ppm histogr3_r.ppm histogr3_s.ppm histogr3.ps

#! -----plot 4 (bimodal)

mv HISTOGR4.PS histogr4.ps
gs -sDEVICE=ppm -sOutputFile=histogr4.ppm  -dNOPAUSE -dBATCH histogr4.ps
~heckert/bin/pnmrotate  -90 histogr4.ppm > histogr4_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 histogr4_r.ppm > histogr4_s.ppm
~heckert/bin/ppmtogif  histogr4_s.ppm > histogr4.gif
mv histogr4.gif ../gif/histogr4.gif
# rm histogr4.ppm histogr4_r.ppm histogr4_s.ppm histogr4.ps

#! -----plot 5 (mixture of 2 normals)

mv HISTOGR5.PS histogr5.ps
gs -sDEVICE=ppm -sOutputFile=histogr5.ppm  -dNOPAUSE -dBATCH histogr5.ps
~heckert/bin/pnmrotate  -90 histogr5.ppm > histogr5_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 histogr5_r.ppm > histogr5_s.ppm
~heckert/bin/ppmtogif  histogr5_s.ppm > histogr5.gif
mv histogr5.gif ../gif/histogr5.gif
# rm histogr5.ppm histogr5_r.ppm histogr5_s.ppm histogr5.ps

#! -----plot 6 (skewed right)

mv HISTOGR6.PS histogr6.ps
gs -sDEVICE=ppm -sOutputFile=histogr6.ppm  -dNOPAUSE -dBATCH histogr6.ps
~heckert/bin/pnmrotate  -90 histogr6.ppm > histogr6_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 histogr6_r.ppm > histogr6_s.ppm
~heckert/bin/ppmtogif  histogr6_s.ppm > histogr6.gif
mv histogr6.gif ../gif/histogr6.gif
# rm histogr6.ppm histogr6_r.ppm histogr6_s.ppm histogr6.ps

#! -----plot 7 (skewed left)

mv HISTOGR7.PS histogr7.ps
gs -sDEVICE=ppm -sOutputFile=histogr7.ppm  -dNOPAUSE -dBATCH histogr7.ps
~heckert/bin/pnmrotate  -90 histogr7.ppm > histogr7_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 histogr7_r.ppm > histogr7_s.ppm
~heckert/bin/ppmtogif  histogr7_s.ppm > histogr7.gif
mv histogr7.gif ../gif/histogr7.gif
# rm histogr7.ppm histogr7_r.ppm histogr7_s.ppm histogr7.ps

#! -----plot 8 (normal with outlier)

mv HISTOGR8.PS histogr8.ps
gs -sDEVICE=ppm -sOutputFile=histogr8.ppm  -dNOPAUSE -dBATCH histogr8.ps
~heckert/bin/pnmrotate  -90 histogr8.ppm > histogr8_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 histogr8_r.ppm > histogr8_s.ppm
~heckert/bin/ppmtogif  histogr8_s.ppm > histogr8.gif
mv histogr8.gif ../gif/histogr8.gif
# rm histogr8.ppm histogr8_r.ppm histogr8_s.ppm histogr8.ps

#!------done-----
