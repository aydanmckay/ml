#!/bin/bash

ephemeral=/scratch
stilts="stilts -Xmx50G -Djava.io.tmpdir=${ephemeral} -verbose"
file="/arc/home/aydanmckay/ml/files.txt"
dir=/arc/home/aydanmckay/dr3tables
in1=/arc/projects/k-pop/catalogues/lamost-dr8-gaiaedr3.fits

function outfile() {
    base1=$(basename ${in2})
    base1=${base1%.*}
    echo ${dir}/${base1}_lamostdr8.fits
}

while read -r line; do
    echo "$line"
    
    in2=/arc/projects/k-pop/spectra/gaia/dr3/xp_continuous_mean_spectrum/$line
    
    ${stilts} tmatch2 \
           in1=${in1} \
           icmd1="keepcols 'ra_obs dec_obs FEH_APOGEE MH_APOGEE CH_APOGEE NH_APOGEE CFE_APOGEE NFE_APOGEE AFE_APOGEE LOGG_APOGEE TEFF_PASTEL LOGG_PASTEL FEH_PASTEL rv err_rv teff_pastel err_feh_pastel err_logg_pastel err_feh_apogee err_mh_apogee err_afe_apogee err_cfe_apogee err_nfe_apogee err_logg_apogee source_id'; colmeta -name id_lamost source_id" \
           values1='id_lamost' \
           in2=${in2} \
           icmd2="keepcols 'source_id bp_coefficients bp_coefficient_errors rp_coefficients rp_coefficient_errors'" \
           values2='source_id' \
           matcher=exact \
           join=1and2 \
           out=$(outfile)
           
done <$file 
       
