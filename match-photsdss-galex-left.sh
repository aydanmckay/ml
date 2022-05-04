#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

sdssphot=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_photobj_dr17.fits
galex=/arc/projects/k-pop/pristine/xmatch/pristine_galex_gr67.fits
outfile=/arc/home/aydanmckay/pristine-sdssphot-galex-left.fits

${stilts} tmatch2 \
        in1=${sdssphot} \
        icmd1="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag E_BV umag gmag rmag imag zmag e_umag e_gmag e_rmag e_imag e_zmag pmRA pmDE e_pmRA e_pmDE angDist'" \
        values1='RA(CaHK) Dec(CaHK)' \
        in2=${galex} \
        icmd2="keepcols 'RA(CaHK) Dec(CaHK) E(B-V) FUVmag e_FUVmag NUVmag e_NUVmag angDist'" \
        values2='RA(CaHK) Dec(CaHK)' \
        matcher=sky \
        params=1.3 \
        join=1and2 \
        find=best \
        out=${outfile}