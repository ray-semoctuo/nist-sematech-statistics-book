iflist=$*

for file in $iflist
do
rfn=`ls $file | cut -d\. -f 1`
echo $rfn
ex - $file << end-of-edit
g/BoundingBox:.*/s//BoundingBox: 0 0 612 792/g
w $rfn.t.ps
q!
end-of-edit
ex - $rfn.r.tex << end-of-edit
a
\documentclass{article}
\oddsidemargin-1.2in
\topmargin6.2in
\usepackage{epsfig}
\begin{document}
\epsfig{file=$rfn.t.ps,width=75pt,height=100pt,angle=-90}
\end{document}
.
wq
end-of-edit
latex $rfn.r.tex
dvips -t letter -o $rfn.r.ps  $rfn.r.dvi
ex - $rfn.r.ps << end-of-edit
g/^%%BoundingBox:.*\$/s//%%BoundingBox: 3 154 98 225/g
wq
end-of-edit
done

gflist=`ls *.r.ps`
echo $gflist

dir=`pwd`
ls $gflist > temp1a
ls $gflist > temp2a
chmod 755 temp*

ex - temp1a << end-of-edit
g?\(.*\)?s??convert -colors 2 $dir/\1 $dir/\1?g
g/\.r\.ps\$/s//\.gif/g
wq
end-of-edit

rsh visage $dir/temp1a

ex - temp2a << end-of-edit
g?\(.*\)?s??giftopnm \1 > \1 ; ppmtogif \1 > \1?g
g/\.r\.ps/s//\.gif/
g/\.r\.ps/s//\.pnm/
g/\.r\.ps/s//\.pnm/
g/\.r\.ps/s//\.gif/
wq
end-of-edit

temp2a
cp *.gif junk.gif
cp *.gif ../gif100

rm temp[12][ab]  *.r.tex *.r.aux *.r.log *.r.dvi *.r.ps *.t.ps *.pnm

echo "convert7.bat done"
echo "---------------------"
echo " "
