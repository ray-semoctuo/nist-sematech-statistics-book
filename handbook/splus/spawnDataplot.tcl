proc spawnDataplot {} {
   global spawnDP xsplus env tcl_platform
   
   update idletasks

#  start dataplot
   if {[findCmd $xsplus(DP_EXEC)]} {
      set spawnDP ""
      set dpok 1
      set str(pipe) "pipe"
      set str(file) "pipe/file"

#  open package with command pipeline
      if {$xsplus(COMM) == "pipe"} {
         set opt r+
      } elseif {$xsplus(COMM) == "file"} {
         set opt r
      }
      if {[catch {open |$xsplus(DP_EXEC) $opt} err]} {
         set msg "Dataplot not opened with a $str($xsplus(COMM))."
         if {[info exists err]} {set msg "$err\n$msg"}
         puts $msg
         tk_messageBox -type ok -message $msg -icon error -title Error
         set dpok 0
      } else {
         set xsplus(pipe) $err
         fconfigure $xsplus(pipe) -buffering line
      }

#  dataplot started ok
      if {$dpok} {
         set text ""
#  fileevent works OK under unix and for windows with Tcl 8.1 or greater       
         if {$xsplus(PLATFORM) == "unix" || [info tclversion] >= 8.1} {
             fileevent $xsplus(pipe) readable [set text [readPipe]]
             fileevent $xsplus(pipe) readable
         } else {
             set text [readPipe]
         }
      }
   }

}

