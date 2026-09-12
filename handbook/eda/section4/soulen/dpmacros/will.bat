#!/bin/csh -f 
#
set name=$1

ex - $name << end-of-edit
g/BoundingBox:.*/s//BoundingBox: 19 23 591 772/g
w! $name
q!
end-of-edit

convert -rotate 90 $name  $name:r.gif

echo "---------------------"
echo "convert7.bat all done"
echo "---------------------"
