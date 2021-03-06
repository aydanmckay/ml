#!/bin/bash

ephemeral=/scratch
stilts="stilts -Xmx50G -Djava.io.tmpdir=${ephemeral} -verbose"
file="/arc/home/aydanmckay/ml/files.txt"
dir=/arc/home/aydanmckay/dr3tables
in1=/arc/home/aydanmckay/union-spec-phot-table.fits

function outfile() {
    base1=$(basename ${in2})
    base1=${base1%.*}
    echo ${dir}/${base1}_spec_phot.fits
}

while read -r line; do
    echo "$line"
    
    in2=/arc/projects/k-pop/spectra/gaia/dr3/xp_continuous_mean_spectrum/$line
    
    ${stilts} tmatch2 \
           in1=${in1} \
           values1='id_lamost' \
           in2=${in2} \
           icmd2="keepcols 'source_id bp_coefficients bp_coefficient_errors rp_coefficients rp_coefficient_errors'" \
           values2='source_id' \
           matcher=sky \
           params=
           join=1and2 \
           out=$(outfile)
           
done <$file 