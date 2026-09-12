proc winParam { } {
   global xsplus env

#  set default executables
   if {$xsplus(PLATFORM) == "unix"} {
      set xsplus(DP_EXEC) /local/bin/Splus5
   } elseif {$xsplus(PLATFORM) == "windows"} {
      set xsplus(DP_EXEC) c:/Dataplot/Dp_cons.exe
   }

#  check if executables and/or libraries and/or fonts are specified in an
#  .xdpConfig or xdpConfig file and use those instead
#  
#  check the following directories for the file
#  1-current dir, 2-user's home dir, 3-dir with xsplus Tcl code
   set found 0
   foreach dir {. $env(HOME) $env(XSPLUS_CODE)} {
      foreach file {.xsplusConfig xsplusConfig} {
         eval set df $dir/$file
         if {$found == 0 && [file exists $df]} {
            set found 1
            set f [open $df r]
            while {[gets $f line] >= 0} {
               set line [string trim $line]
               set c1 [string range $line 0 0]
               if {$line != "" && $c1 != "#"} {
                  set line1 [lindex $line 0]
                  set line2 [lindex $line 1]
                  set line3 [lindex $line 2]
                  if {$line2 == $xsplus(PLATFORM) || $line2 == $xsplus(OS)} {
                     if {$line1 == "dataplot"} {
                      eval set xsplus(DP_EXEC) {$line3}
                     } elseif {$line1 == "library"} {
                      eval set xsplus(DP_LIB) {$line3}
                     }
                  }
               }
            }
         }
      }
   }
   

}

