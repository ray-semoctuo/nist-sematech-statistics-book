#!/bin/csh
#
#  Make a zip file of the R codes and data sets.
#
rm R_Codes_and_Data.zip
zip -r  R_Codes_and_Data.zip  *.r Rdata
