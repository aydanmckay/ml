#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

catmass=/arc/home/aydanmckay/pristine-2mass-catwise-exact.fits
galsdss=/arc/home/aydanmckay/pristine-sdssphot-galex-exact.fits
outfile=/arc/home/aydanmckay/pristine-2mass-wise-sdss-galex-exact.fits

${stilts} tmatch2 \
        in1=${catmass} \
        icmd1="colmeta -name pris_2mass_angDist angDist_1; colmeta -name pris_wise_angDist angDist_2; colmeta -name 2mass_wise_sep Separation" \
        values1='ra dec CaHK' \
        in2=${galsdss} \
        icmd2="colmeta -name pris_sdss_angDist angDist_1; colmeta -name pris_galex_angDist angDist_2; colmeta -name sdss_galex_sep Separation" \
        values2='ra dec CaHK' \
        matcher=exact+exact+exact \
        join=1and2 \
        ocmd="delcols 'ra_2 dec_2 CaHK_2'; colmeta -name ra ra_1; colmeta -name dec dec_1; colmeta -name CaHK CaHK_1" \
        out=${outfile}
