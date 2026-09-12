#!/bin/csh -f
# dataplot < scatplot.dp

#! -----plot 0 (typical scatter plot)-----

mv SCATPLO0.PS scatplo0.ps
gs -sDEVICE=ppm -sOutputFile=scatplo0.ppm  -dNOPAUSE -dBATCH scatplo0.ps
~heckert/bin/pnmrotate  -90 scatplo0.ppm > scatplo0_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatplo0_r.ppm > scatplo0_s.ppm
~heckert/bin/ppmtogif  scatplo0_s.ppm > scatplo0.gif
mv scatplo0.gif ../gif/scatplo0.gif
# rm scatplo0.ppm scatplo0_r.ppm scatplo0_s.ppm scatplo1.ps

#! -----plot 1 (no relationship)-----

mv SCATPLO1.PS scatplo1.ps
gs -sDEVICE=ppm -sOutputFile=scatplo1.ppm  -dNOPAUSE -dBATCH scatplo1.ps
~heckert/bin/pnmrotate  -90 scatplo1.ppm > scatplo1_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatplo1_r.ppm > scatplo1_s.ppm
~heckert/bin/ppmtogif  scatplo1_s.ppm > scatplo1.gif
mv scatplo1.gif ../gif/scatplo1.gif
# rm scatplo1.ppm scatplo1_r.ppm scatplo1_s.ppm scatplo1.ps

#! -----plot 2 (string linear with positive correlation)-----

mv SCATPLO2.PS scatplo2.ps
gs -sDEVICE=ppm -sOutputFile=scatplo2.ppm  -dNOPAUSE -dBATCH scatplo2.ps
~heckert/bin/pnmrotate  -90 scatplo2.ppm > scatplo2_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatplo2_r.ppm > scatplo2_s.ppm
~heckert/bin/ppmtogif  scatplo2_s.ppm > scatplo2.gif
mv scatplo2.gif ../gif/scatplo2.gif
# rm scatplo2.ppm scatplo2_r.ppm scatplo2_s.ppm scatplo2.ps

#! -----plot 3 (strong linear with negative correlation)-----

mv SCATPLO3.PS scatplo3.ps
gs -sDEVICE=ppm -sOutputFile=scatplo3.ppm  -dNOPAUSE -dBATCH scatplo3.ps
~heckert/bin/pnmrotate  -90 scatplo3.ppm > scatplo3_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatplo3_r.ppm > scatplo3_s.ppm
~heckert/bin/ppmtogif  scatplo3_s.ppm > scatplo3.gif
mv scatplo3.gif ../gif/scatplo3.gif
# rm scatplo3.ppm scatplo3_r.ppm scatplo3_s.ppm scatplo3.ps

#! -----plot 4 (exact linear with negative correlation)-----

mv SCATPLO4.PS scatplo4.ps
gs -sDEVICE=ppm -sOutputFile=scatplo4.ppm  -dNOPAUSE -dBATCH scatplo4.ps
~heckert/bin/pnmrotate  -90 scatplo4.ppm > scatplo4_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatplo4_r.ppm > scatplo4_s.ppm
~heckert/bin/ppmtogif  scatplo4_s.ppm > scatplo4.gif
mv scatplo4.gif ../gif/scatplo4.gif
# rm scatplo4.ppm scatplo4_r.ppm scatplo4_s.ppm scatplo4.ps

#! -----plot 5 (quadratic)-----

mv SCATPLO5.PS scatplo5.ps
gs -sDEVICE=ppm -sOutputFile=scatplo5.ppm  -dNOPAUSE -dBATCH scatplo5.ps
~heckert/bin/pnmrotate  -90 scatplo5.ppm > scatplo5_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatplo5_r.ppm > scatplo5_s.ppm
~heckert/bin/ppmtogif  scatplo5_s.ppm > scatplo5.gif
mv scatplo5.gif ../gif/scatplo5.gif
# rm scatplo5.ppm scatplo5_r.ppm scatplo5_s.ppm scatplo5.ps

#! -----plot 6 (exponential)-----

mv SCATPLO6.PS scatplo6.ps
gs -sDEVICE=ppm -sOutputFile=scatplo6.ppm  -dNOPAUSE -dBATCH scatplo6.ps
~heckert/bin/pnmrotate  -90 scatplo6.ppm > scatplo6_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatplo6_r.ppm > scatplo6_s.ppm
~heckert/bin/ppmtogif  scatplo6_s.ppm > scatplo6.gif
mv scatplo6.gif ../gif/scatplo6.gif
# rm scatplo6.ppm scatplo6_r.ppm scatplo6_s.ppm scatplo6.ps

#! -----plot 7 (sinosoidal damped)-----

mv SCATPLO7.PS scatplo7.ps
gs -sDEVICE=ppm -sOutputFile=scatplo7.ppm  -dNOPAUSE -dBATCH scatplo7.ps
~heckert/bin/pnmrotate  -90 scatplo7.ppm > scatplo7_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatplo7_r.ppm > scatplo7_s.ppm
~heckert/bin/ppmtogif  scatplo7_s.ppm > scatplo7.gif
mv scatplo7.gif ../gif/scatplo7.gif
# rm scatplo7.ppm scatplo7_r.ppm scatplo7_s.ppm scatplo7.ps

#! -----plot 8 (homoscedastic)-----

mv SCATPLO8.PS scatplo8.ps
gs -sDEVICE=ppm -sOutputFile=scatplo8.ppm  -dNOPAUSE -dBATCH scatplo8.ps
~heckert/bin/pnmrotate  -90 scatplo8.ppm > scatplo8_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatplo8_r.ppm > scatplo8_s.ppm
~heckert/bin/ppmtogif  scatplo8_s.ppm > scatplo8.gif
mv scatplo8.gif ../gif/scatplo8.gif
# rm scatplo8.ppm scatplo8_r.ppm scatplo8_s.ppm scatplo8.ps

#! -----plot 9 (heteroscedastic)-----

mv SCATPLO9.PS scatplo9.ps
gs -sDEVICE=ppm -sOutputFile=scatplo9.ppm  -dNOPAUSE -dBATCH scatplo9.ps
~heckert/bin/pnmrotate  -90 scatplo9.ppm > scatplo9_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatplo9_r.ppm > scatplo9_s.ppm
~heckert/bin/ppmtogif  scatplo9_s.ppm > scatplo9.gif
mv scatplo9.gif ../gif/scatplo9.gif
# rm scatplo9.ppm scatplo9_r.ppm scatplo9_s.ppm scatplo9.ps

#! -----plot 10 (outlier)-----

mv SCATPLOA.PS scatploa.ps
gs -sDEVICE=ppm -sOutputFile=scatploa.ppm  -dNOPAUSE -dBATCH scatploa.ps
~heckert/bin/pnmrotate  -90 scatploa.ppm > scatploa_r.ppm
~heckert/bin/pnmscale  -xscale 0.5 -yscale 0.5 scatploa_r.ppm > scatploa_s.ppm
~heckert/bin/ppmtogif  scatploa_s.ppm > scatploa.gif
mv scatploa.gif ../gif/scatploa.gif
# rm scatploa.ppm scatploa_r.ppm scatploa_s.ppm scatploa.ps

