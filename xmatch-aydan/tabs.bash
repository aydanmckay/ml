#!/bin/bash

ephemeral=/scratch
stilts="stilts -Xmx50G -Djava.io.tmpdir=${ephemeral} -verbose"
file=/arc/home/aydanmckay/ml/files.txt

function outfile() {
    base1=$(basename ${in2})
    base1=${base1%.*}
    echo ${base1}_lamostdr8.fits
}

while read -r line; do
    echo "$line"
    
    in2=/arc/projects/k-pop/spectra/gaia/dr3/xp_continuous_mean_spectrum/$line
    
    asttable -i /arc/home/aydanmckay/dr3tables/$(outfile) > output.txt
    
    a=$(head -n 37 output.txt | tail -n 1)
        
    if [ "$a" == "Number of rows: 0" ]
    then
    rm /arc/home/aydanmckay/dr3tables/$(outfile)
    else
    echo "$a"
    fi
    
done <$file 