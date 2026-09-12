iflist=$*

for file in $iflist
do
rfn=`ls $file | cut -d\. -f 1`
echo ${rfn}
ex - $file << end-of-edit
g/BoundingBox:.*/s//BoundingBox: 0 0 612 792/g
wq
end-of-edit
ex - ${rfn}_r.tex << end-of-edit
a
\documentclass{article}
\oddsidemargin-1.22in
\evensidemargin-1.22in
\textwidth8.5in
\topmargin4.1in
\textheight11in
\pagestyle{empty}
\topskip0in
\headheight0in
\headsep0in
\marginparsep0in
\marginparwidth0in
\paperheight11in
\paperwidth8.5in
\usepackage{epsfig}
\begin{document}
\epsfig{file=$file,width=425pt,height=550pt,angle=-90}
\end{document}
.
wq
end-of-edit
latex ${rfn}_r.tex
dvips -t letter -o ${rfn}_r.ps  ${rfn}_r.dvi
ex - ${rfn}_r.ps << end-of-edit
g/^%%BoundingBox:.*\$/s//%%BoundingBox: 0 0 550 425/g
wq
end-of-edit
done

gflist=`ls *_r.ps`
echo $gflist

dir=`pwd`
ls $gflist > temp1
ls $iflist > temp2
ls $gflist > temp3
ls $iflist > temp4
ls $gflist > temp5
chmod 755 temp*

ex - temp1 << end-of-edit
g?\(.*\)?s??convert -colors 2 $dir/\1 $dir/\1?g
g/ps\$/s//gif/g
wq
end-of-edit

temp1

ex - temp2 << end-of-edit
g?\(.*\)?s??convert -colors 2 -rotate 90 $dir/\1 $dir/\1?g
g/\.ps\$/s//\_f.gif/g
wq
end-of-edit

temp2

ex - temp3 << end-of-edit
g?\(.*\)?s??shrink $dir/\1?g
g/\.ps\$/s//\.gif/g
wq
end-of-edit

temp3

ex - temp4 << end-of-edit
g?\(.*\)?s??shrink $dir/\1?g
g/\.ps\$/s//\_f.gif/g
wq
end-of-edit

temp4

ex - temp5 << end-of-edit
g?\(.*\)?s??stb $dir/\1?g
g/\.ps\$/s//\.gif/g
wq
end-of-edit

temp5

rm temp[12345] *_r.tex *_r.aux *_r.log *_r.dvi *_r.ps
