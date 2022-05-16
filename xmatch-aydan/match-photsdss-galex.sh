#!/bin/bash
#

scratch=/scratch
stilts="stilts -Xmx150G -Djava.io.tmpdir=${scratch} -verbose"

sdssphot=/arc/projects/k-pop/pristine/xmatch/pristine_sdss_photobj_dr17.fits
galex=/arc/projects/k-pop/pristine/xmatch/pristine_galex_gr67.fits
outfile=/arc/home/aydanmckay/tables/pristine-sdssphot-galex.fits

${stilts} tmatch2 \
        in1=${sdssphot} \
        icmd1="keepcols 'RA(CaHK) Dec(CaHK) CaHK_0 e_CaHK flag E_BV RA_ICRS DE_ICRS umag gmag rmag imag zmag e_umag e_gmag e_rmag e_imag e_zmag pmRA pmDE e_pmRA e_pmDE angDist'" \
        values1='RA_ICRS DE_ICRS' \
        in2=${galex} \
        icmd2="keepcols 'RAJ2000 DEJ2000 E(B-V) FUVmag e_FUVmag NUVmag e_NUVmag angDist'" \
        values2='RAJ2000 DEJ2000' \
        matcher=sky \
        params=1.3 \
        join=1and2 \
        out=${outfile}
