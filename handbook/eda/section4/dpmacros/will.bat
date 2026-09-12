iflist=$*

hdir="/local/home/luser/wwwsed/handbook/eda/section4/dpmacros"

for file in $iflist
do
cp   $file   /home/fs1d/heckert/tmp
cd /home/fs1d/heckert/tmp
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
\topmargin5.2in
\usepackage{epsfig}
\begin{document}
\epsfig{file=$rfn.t.ps,width=300pt,height=400pt,angle=-90}
\end{document}
.
wq
end-of-edit
latex $rfn.r.tex
dvips -t letter -o $rfn.r.ps  $rfn.r.dvi
ex - $rfn.r.ps << end-of-edit
g/^%%BoundingBox:.*\$/s//%%BoundingBox: 10 9 390 289/g
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

rsh visage.cam.nist.gov /home/fs1d/heckert/tmp/temp1a

ex - temp2a << end-of-edit
g?\(.*\)?s??giftopnm \1 > \1 ; ppmtogif \1 > \1?g
g/\.r\.ps/s//\.gif/
g/\.r\.ps/s//\.pnm/
g/\.r\.ps/s//\.pnm/
g/\.r\.ps/s//\.gif/
wq
end-of-edit

temp2a
mv *.gif $hdir/../gif

rm temp[12][ab]  *.r.tex *.r.aux *.r.log *.r.dvi *.r.ps *.t.ps *.pnm

echo "---------------------"
echo "convert7.bat all done"
echo "---------------------"
