for file in $*
do
ex - $file << end-of-edit
g/system sleep/d
wq
end-of-edit
done
