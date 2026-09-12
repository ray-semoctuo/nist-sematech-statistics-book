######################################################################

proc cursorConfig {type} {
   global xsplus

#  create list of windows
   set win {.}

#  change cursor configuration
   foreach i $win {
      if {[winfo exists $i]} {catch {$i config -cursor "$type red white"}}
   }
   update idletasks
}
