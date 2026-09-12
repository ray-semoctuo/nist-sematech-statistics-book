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
g/^%%BoundingBox:.*\$/s//%%BoundingBox: 0 0 400 300/g
wq
end-of-edit
done

gflist=`ls *.r.ps`
echo $gflist

dir=`pwd`
ls $gflist > temp1a
chmod 755 temp*

ex - temp1a << end-of-edit
g?\(.*\)?s??convert -colors 2 $dir/\1 $dir/\1?g
g/\.r\.ps\$/s//\.gif/g
wq
end-of-edit

rsh trindy $dir/temp1a
rm temp[12][ab]  *.r.tex *.r.aux *.r.log *.r.dvi *.r.ps *.t.ps
mv *.gif ../gif
