#!/bin/csh -f
#! this is file    lagplot.bat
#! purpose--transform dataplot postscript output files    LAGPLOTX.PS
#!          (which reside in this .../ps directory)
#!          into individual gif files   lagplotx.gif   
#!          (which are automatically placed in the .../gif directory)
#!          for use in the sematech handbook

#! -----plot 0 (typical lag plot)-----

mv LAGPLOT0.PS lagplot0.ps
gs -sDEVICE=ppm -sOutputFile=lagplot0.ppm  -dNOPAUSE -dBATCH lagplot0.ps
~heckert/bin/pnmrotate  -90 lagplot0.ppm > lagplot0_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 lagplot0_r.ppm > lagplot0_s.ppm
~heckert/bin/ppmtogif  lagplot0_s.ppm > lagplot0.gif
mv lagplot0.gif ../gif/lagplot0.gif
# rm lagplot0.ppm lagplot0_r.ppm lagplot0_s.ppm lagplot1.ps

#! -----plot 1 (random)-----

mv LAGPLOT1.PS lagplot1.ps
gs -sDEVICE=ppm -sOutputFile=lagplot1.ppm  -dNOPAUSE -dBATCH lagplot1.ps
~heckert/bin/pnmrotate  -90 lagplot1.ppm > lagplot1_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 lagplot1_r.ppm > lagplot1_s.ppm
~heckert/bin/ppmtogif  lagplot1_s.ppm > lagplot1.gif
mv lagplot1.gif ../gif/lagplot1.gif
# rm lagplot1.ppm lagplot1_r.ppm lagplot1_s.ppm lagplot1.ps

#! -----plot 2 (moderate autocorrelation)

mv LAGPLOT2.PS lagplot2.ps
gs -sDEVICE=ppm -sOutputFile=lagplot2.ppm  -dNOPAUSE -dBATCH lagplot2.ps
~heckert/bin/pnmrotate  -90 lagplot2.ppm > lagplot2_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 lagplot2_r.ppm > lagplot2_s.ppm
~heckert/bin/ppmtogif  lagplot2_s.ppm > lagplot2.gif
mv lagplot2.gif ../gif/lagplot2.gif
# rm lagplot2.ppm lagplot2_r.ppm lagplot2_s.ppm lagplot2.ps

#! -----plot 3 (strong autocorrelation)-----

mv LAGPLOT3.PS lagplot3.ps
gs -sDEVICE=ppm -sOutputFile=lagplot3.ppm  -dNOPAUSE -dBATCH lagplot3.ps
~heckert/bin/pnmrotate  -90 lagplot3.ppm > lagplot3_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 lagplot3_r.ppm > lagplot3_s.ppm
~heckert/bin/ppmtogif  lagplot3_s.ppm > lagplot3.gif
mv lagplot3.gif ../gif/lagplot3.gif
# rm lagplot3.ppm lagplot3_r.ppm lagplot3_s.ppm lagplot3.ps

#! -----plot 4 (sinuosoidal model)-------

mv LAGPLOT4.PS lagplot4.ps
gs -sDEVICE=ppm -sOutputFile=lagplot4.ppm  -dNOPAUSE -dBATCH lagplot4.ps
~heckert/bin/pnmrotate  -90 lagplot4.ppm > lagplot4_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 lagplot4_r.ppm > lagplot4_s.ppm
~heckert/bin/ppmtogif  lagplot4_s.ppm > lagplot4.gif
mv lagplot4.gif ../gif/lagplot4.gif
# rm lagplot4.ppm lagplot4_r.ppm lagplot4_s.ppm lagplot4.ps

#!------done-----
