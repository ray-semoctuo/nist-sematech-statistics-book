#!/bin/csh -f
foreach name (`ls *.PS`)
set new_name = `echo $name | tr "[A-Z]" "[a-z]"`
mv $name $new_name
end
