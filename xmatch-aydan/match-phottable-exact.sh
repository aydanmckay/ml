#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

masswisesdssgalex=/arc/home/aydanmckay/tables/pristine-2mass-wise-sdss-galex-exact.fits
cfisgaialegacypans=/arc/home/aydanmckay/tables/pristine-cfis-pans-gaia-legacy-exact.fits
outfile=/arc/home/aydanmckay/tables/pristine-xmatch-phottable-exact.fits

${stilts} tmatch2 \
        in1=${masswisesdssgalex} \
        icmd1="delcols 'e_CaHK_2 flag_2 E_BV_2 RAJ2000 DEJ2000'; colmeta -name e_CaHK e_CaHK_1; colmeta -name flag flag_1; colmeta -name E_BV E_BV_1; colmeta -name pmRA_wise pmRA_1; colmeta -name pmDE_wise pmDE_1; colmeta -name e_pmRA_wise e_pmRA_1; colmeta -name e_pmDE_wise e_pmDE_1; colmeta -name pmRA_sdss pmRA_2; colmeta -name pmDE_sdss pmDE_2; colmeta -name e_pmRA_sdss e_pmRA_2; colmeta -name e_pmDE_sdss e_pmDE_2" \
        values1='ra dec CaHK' \
        in2=${cfisgaialegacypans} \
        icmd2="delcols 'e_CaHK flag E_BV'" \
        values2='ra dec CaHK' \
        matcher=exact+exact+exact \
        join=1and2 \
        ocmd="delcols 'ra_2 dec_2 CaHK_2'; colmeta -name ra ra_1; colmeta -name dec dec_1; colmeta -name CaHK CaHK_1" \
        out=${outfile}