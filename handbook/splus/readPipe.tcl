######################################################################

proc readPipe {} {
   global xsplus
   
   if {$xsplus(DEBUG)} {puts "ENTER readPipe"}
   set text ""
   while {1} {
      gets $xsplus(pipe) line
      if {$xsplus(DEBUG)} {puts $line}
      lappend text $line
      #if {[string first ">" [string range $line 0 2]] != -1} {return $text}
      if {[string match "*>*" $line ] != -1} {return $text}
      #if {[string match "\n*" $line ] != -1} {return $text}
   }
}

