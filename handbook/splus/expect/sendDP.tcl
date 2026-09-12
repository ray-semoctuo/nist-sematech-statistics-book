######################################################################

#  send command to Dataplot and expect certain strings

proc sendDP {cmd} {
   global spawnDP nsavCmd savCmd xsplus timeout pix
   global iRcl nRcl rclCmd resetTimeout echoInTextout DS GS canVas dsExp

   if {$xsplus(DEBUG)} {puts "\nENTER sendDP"}

#  check for certain commands
   set slow 0
   set cmdstr [split $cmd " "]
   set cmdlen [llength $cmdstr]
   set cmd1 [string tolower [lindex $cmdstr 0]]
   set cmd2 [string tolower [lindex $cmdstr 1]]
   set cmd3 [string tolower [lindex $cmdstr 2]]
   set cmd4 [string tolower [lindex $cmdstr 3]]
   set cmd5 [string tolower [lindex $cmdstr 4]]
   set xsplus(cmd1) $cmd1

#  ------------------------------------------------------------------
      
#  send command to dataplot and wait for possibly a lot of output
   set buffer ""
   set spawn_id $spawnDP
   if {$xsplus(DEBUG)} {puts "  Sending: $cmd"}

#  send the command for expect, set match_max (buffer size) depending on 'slow'
#  puts the command for a pipe
   puts $xsplus(pipe) $cmd
   if {$xsplus(DEBUG)} {puts "  Sent"}

#  --------------------------------------------------------------------

#  read command pipeline channel if not using expect
     if {$cmd1 == "exit"} {exit}
     if {$cmd1 == "q()"} {exit}
     if {$xsplus(DEBUG)} {puts "  Before first fileevent\n"}
     fileevent $xsplus(pipe) readable [set buffer [readPipe]]
     if {$xsplus(DEBUG)} {puts "  Before second fileevent\n"}
     fileevent $xsplus(pipe) readable
     if {$xsplus(DEBUG)} {puts "  Before set buffer\n"}
     set buffer [linsert $buffer 0 { } $cmd]
     if {$xsplus(DEBUG)} {puts "  Pipe done"}

     set text $buffer
     regsub -all {\{} $text " " text
     regsub -all {\}} $text "\n " text
     puts $text

#  --------------------------------------------------------------------

   if {$xsplus(DEBUG)} {puts " LEAVE sendDP"}

}   

