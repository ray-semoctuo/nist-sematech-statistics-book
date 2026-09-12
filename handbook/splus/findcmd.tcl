######################################################################

#  Look for commands in directories of PATH environment variable
#  or if it exists if an absolute path is given

proc findCmd {cmd} {
   global env xsplus
   if {$xsplus(PLATFORM) == "unix"} {set schar ":"}
   if {$xsplus(PLATFORM) == "windows"} {set schar ";"}

   if {[file dirname $cmd] == "."} {
      if {[info exists env(PATH)]} {
        foreach dir [split $env(PATH) $schar] {
           set pathname [file join $dir $cmd]
           if {[file exists $pathname]} {
              if {[file isfile $pathname] && [file executable $pathname]} {return 1}
           }
        }
        if {$cmd != ""} {
           set msg "ERROR: $cmd  not found in PATH environment variable"
            puts $msg
        }
      }
   } else {
      if {[file exists $cmd]} {return 1}
   }
   return 0
}

