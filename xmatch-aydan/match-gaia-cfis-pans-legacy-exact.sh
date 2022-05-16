#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

gaialeg=/arc/home/aydanmckay/tables/pristine-legacy-gaiaedr3-exact.fits
cfispan=/arc/home/aydanmckay/tables/pristine-cfis-panstarrs-exact.fits
outfile=/arc/home/aydanmckay/tables/pristine-cfis-pans-gaia-legacy-exact.fits

${stilts} tmatch2 \
        in1=${gaialeg} \
        icmd1="colmeta -name pris_legacy_sep Separation_1; colmeta -name pris_gaia_sep angDist; colmeta -name legacy_gaia_sep Separation" \
        values1='ra dec CaHK' \
        in2=${cfispan} \
        icmd2="delcols 'e_CaHK flag'; colmeta -name pris_cfis_sep Separation_1; colmeta -name pris_pans_sep Separation_2; colmeta -name cfis_pans_sep Separation" \
        values2='RA(CaHK) Dec(CaHK) CaHK' \
        matcher=exact+exact+exact \
        join=1and2 \
        ocmd="delcols 'RA(CaHK) Dec(CaHK) CaHK_2'; colmeta -name CaHK CaHK_1" \
        out=${outfile}