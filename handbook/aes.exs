for file in $*
do
ex - $file << end-of-edit
g/\(http:[^"]\)/s//http:\/\/www.nist.gov\/cgi-bin\/exit_nist.cgi?url=\1/g
g/http:\/\/www\.nist\.gov\/cgi-bin\/exit_nist.cgi?url=http:\/\/www\.nist\.gov/s//http:\/\/www.nist.gov/g
g/http:\/\/www\.nist\.gov\/cgi-bin\/exit_nist.cgi?url=http:\/\/www\.itl\.nist\.gov/s//http:\/\/www.itl.nist.gov/g
g/http:\/\/www\.nist\.gov\/cgi-bin\/exit_nist.cgi?url=http:\/\/www\.firstgov\.gov/s//http:\/\/www.firstgov.gov/g
wq
end-of-edit
done
