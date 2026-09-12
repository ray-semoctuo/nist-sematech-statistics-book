iflist=$*

for file in $iflist
do
rfn=`ls $file | cut -d\. -f 1`
echo $rfn
ex - $file << end-of-edit
g/BoundingBox:.*/s//BoundingBox: 0 0 612 792/g
wq
end-of-edit
ex - $rfn.r.tex << end-of-edit
a
\documentclass{article}
\oddsidemargin-1.075in
\topmargin3.35in
\usepackage{epsfig}
\begin{document}
\epsfig{file=$file,width=425pt,height=550pt,angle=-90}
\end{document}
.
wq
end-of-edit
latex $rfn.r.tex
dvips -t letter -o $rfn.r.ps  $rfn.r.dvi
ex - $rfn.r.ps << end-of-edit
g/^%%BoundingBox:.*\$/s//%%BoundingBox: 0 0 550 425/g
wq
end-of-edit
done

gflist=`ls *.r.ps`
echo $gflist

dir=`pwd`
ls $gflist > temp1a
ls $gflist > temp1b
ls $iflist > temp2a
chmod 755 temp*

ex - temp1a << end-of-edit
g?\(.*\)?s??convert -colors 2 $dir/\1 $dir/\1?g
g/ps\$/s//gif/g
wq
end-of-edit

ex - temp1b << end-of-edit
g?\(.*\)?s??giftrans -t \\\\#ffffff -o temp.gif \1 ; mv temp.gif \1?g
g/\.ps/s//\.gif/g
wq
end-of-edit

rsh trindy $dir/temp1a
temp1b

ex - temp2a << end-of-edit
g?\(.*\)?s??convert -rotate 90 -colors 2 $dir/\1 $dir/\1?g
g/\.ps\$/s//\.gif/g
wq
end-of-edit

rsh trindy $dir/temp2a

rm temp[12][ab]  *.r.tex *.r.aux *.r.log *.r.dvi *.r.ps
echo " "
echo "convert7.bat all done"
echo "----------"
